import 'package:chandigarh_fasion/screen/VideoStartPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Text(
                textAlign: TextAlign.center,
                "Show your excitement in \nA video message",
                style: TextStyle(
                    color: HexColor("#FFFFFF"),
                    fontSize: size.width * 0.040,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Text(
                textAlign: TextAlign.center,
                "LET'S CAPTURE \nYOUR BEST \nMOMENTS !!!",
                style: TextStyle(
                    color: HexColor("#FFFFFF"),
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/videostartpage");
                },
                child: Image.asset(
                  "assets/images/Next.png",
                  width: size.width * 0.16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
