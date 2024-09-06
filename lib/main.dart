import 'package:chandigarh_fasion/screen/HomePage.dart';
import 'package:chandigarh_fasion/screen/ThankYouPage.dart';
import 'package:chandigarh_fasion/screen/VideoStartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chandigarh Fasion Week',
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        //'/': (context) => const ThankYouPage(),
        '/videostartpage': (context) => const VideoStartPage(),
      },
    );
  }
}
