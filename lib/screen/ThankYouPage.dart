import 'package:chandigarh_fasion/screen/HomePage.dart';
import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/thankyoubackground.png"),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Image.asset(
              'assets/images/thankyoumsg.png',
              width: size.width * 0.7,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.09),
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route<dynamic> route) => false);
              },
              child: Image.asset(
                "assets/images/thankyouhomebutton.png",
                width: size.width * 0.215,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
