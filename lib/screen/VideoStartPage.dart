import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chandigarh_fasion/screen/ConfirmAndRetakeScreen.dart';
import 'package:chandigarh_fasion/screen/DemoLastScreen.dart';
import 'package:chandigarh_fasion/screen/ThankYouPage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoStartPage extends StatefulWidget {
  const VideoStartPage({super.key});

  @override
  State<VideoStartPage> createState() => _VideoStartPageState();
}

class _VideoStartPageState extends State<VideoStartPage> {
  bool startCameraCondition = false;
  late CameraController cameraController;
  bool _inCameraInitialized = false;
  bool _isRecording = false;
  String videoFileName = "";

  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = cameraController.initialize();
      _initializeControllerFuture.then((_) async {
        await cameraController.setFlashMode(FlashMode.off);
        if (mounted) {
          setState(() {
            _inCameraInitialized = true;
          });
        }
      });
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> startVideoRecording() async {
    try {
      if (cameraController.value.isInitialized) {
        await cameraController.startVideoRecording();
        setState(() {
          _isRecording = true;
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> stopVideoRecording() async {
    try {
      if (_isRecording) {
        final XFile videoFile = await cameraController.stopVideoRecording();
        setState(() {
          _isRecording = false;
          videoFileName = videoFile.path;
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            startCameraCondition
                ? Positioned(
                    child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: CameraPreview(cameraController),
                  ))
                : Positioned(
                    child: Image.asset(
                    "assets/images/previewImg.png",
                    fit: BoxFit.cover,
                    height: size.height,
                    width: size.width,
                  )),
            Positioned(
                child: Image.asset(
              "assets/images/bg.png",
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            )),
            Positioned(
                bottom: size.width * 0.05,
                left: size.width * 0.03,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/homeButton.png",
                    width: 150,
                  ),
                )),
            startCameraCondition
                ? Positioned(
                    bottom: size.width * 0.15,
                    child: SizedBox(
                      width: size.width,
                      child: Center(
                          child: GestureDetector(
                        onTap: () async {
                          await stopVideoRecording();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmAndRetakeScreen(
                                      videoPath: videoFileName)));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           DemoLastScreen(filePath: videoFileName),
                          //     ));
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const ThankYouPage()),
                          //     (Route<dynamic> route) => false);
                        },
                        child: Image.asset(
                          "assets/images/stop.png",
                          width: 100,
                        ),
                      )),
                    ))
                : Positioned(
                    bottom: size.width * 0.15,
                    child: SizedBox(
                      width: size.width,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            startCameraCondition = true;
                          });
                          startVideoRecording();
                        },
                        child: Image.asset(
                          "assets/images/TapHere.png",
                          width: 100,
                        ),
                      )),
                    ))
          ],
        ),
      ),
    );
  }
}
