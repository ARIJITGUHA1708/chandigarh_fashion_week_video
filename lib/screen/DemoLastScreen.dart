import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DemoLastScreen extends StatefulWidget {
  final String filePath;
  DemoLastScreen({required this.filePath});

  @override
  State<DemoLastScreen> createState() => _DemoLastScreenState();
}

class _DemoLastScreenState extends State<DemoLastScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.filePath))
      ..initialize().then((_) {
        setState(() {});
      });
    debugPrint(widget.filePath);
    debugPrint(
        "...................................................................................................");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      // height: 100,
      // width: 100,
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
    ));
  }
}
