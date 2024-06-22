import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';

class Wifi extends StatefulWidget {
  const Wifi({super.key});

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> {
  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color white = Color(0xFFFBFFFE);
    const Color grey = Color(0xFF4E878C);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: black,
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Column(
                  children: [
                    Image.asset("assets/foodease.png"),
                    SizedBox(
                      height: 160,
                    ),
                    Image.asset(
                      "assets/bg1.png",
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Image.asset(
                      "assets/wifi.png",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Connect with Device",
                    style: TextStyle(
                        color: orange, fontSize: 24, fontFamily: 'Lexend'),
                  ),
                  Text(
                    "Hurray! You are ready to pair the Device.",
                    style: TextStyle(
                        color: grey, fontSize: 15, fontFamily: 'Lexend'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.wifideviceRoute);
                    },
                    child: Container(
                      width: 295,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: orange,
                      ),
                      child: Center(
                        child: Text(
                          "GET STARTED",
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'Lexend_w'),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontFamily: 'Lexend',
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                          decorationColor: black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
