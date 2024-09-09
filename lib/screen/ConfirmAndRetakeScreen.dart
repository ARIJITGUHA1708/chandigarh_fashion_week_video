import 'package:chandigarh_fasion/screen/HomePage.dart';
import 'package:chandigarh_fasion/screen/ThankYouPage.dart';
import 'package:chandigarh_fasion/screen/VideoStartPage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class ConfirmAndRetakeScreen extends StatefulWidget {
  String videoPath = "";
  ConfirmAndRetakeScreen({super.key, required this.videoPath});

  @override
  State<ConfirmAndRetakeScreen> createState() => _ConfirmAndRetakeScreenState();
}

class _ConfirmAndRetakeScreenState extends State<ConfirmAndRetakeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        // width: width,
        // height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Preview",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: width * 0.70,
                width: width * 0.40,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.white)),
                child: Stack(
                  children: [
                    Positioned(
                        child: AspectRatio(
                      aspectRatio: 3 / 5,
                      child: VideoPlayer(_controller),
                    )),
                    Positioned(
                        child: Image.asset(
                      "assets/images/bg.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VideoStartPage()));
                      },
                      child: Image.asset(
                        "assets/images/RETAKE.png",
                        width: width * 0.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThankYouPage()));
                      },
                      child: Image.asset(
                        "assets/images/confirmWithRetake.png",
                        width: width * 0.2,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.02,
              bottom: MediaQuery.of(context).size.width * 0.02,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false);
                },
                child: Image.asset(
                  "assets/images/homeButton.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ))
        ]),
      ),
    );
  }
}
