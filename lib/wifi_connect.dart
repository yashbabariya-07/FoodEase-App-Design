import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';

class WifiConnect extends StatefulWidget {
  const WifiConnect({super.key});

  @override
  State<WifiConnect> createState() => _WifiConnectState();
}

class _WifiConnectState extends State<WifiConnect> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color grey = Color(0xFF4E878C);
    const Color white = Color(0xFFFBFFFE);

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: black,
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Image.asset(
                    "assets/foodease.png",
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    "assets/bg1.png",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Find Your Device",
                  style: TextStyle(
                      color: black, fontSize: 24, fontFamily: 'Lexend_w'),
                ),
                Text(
                  "Pairing the Device.",
                  style: TextStyle(
                      color: grey, fontSize: 13, fontFamily: 'Lexend'),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected1 = !isSelected1;
                    });
                  },
                  child: Container(
                    height: 72,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected1 ? orange : grey)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/circle.png"),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Foodease-0D0F_P",
                                  style: TextStyle(
                                    color: isSelected1 ? black : grey,
                                    fontSize: 15,
                                    fontFamily:
                                        isSelected1 ? 'Lexend_w' : 'Lexend',
                                  ),
                                ),
                              ],
                            ),
                            if (isSelected1) Image.asset("assets/hotspot.png"),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                  child: Container(
                    height: 72,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected2 ? orange : grey)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/circle.png"),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Foodease-0F0F_s",
                                  style: TextStyle(
                                    color: isSelected2 ? black : grey,
                                    fontSize: 15,
                                    fontFamily:
                                        isSelected2 ? 'Lexend_w' : 'Lexend',
                                  ),
                                ),
                              ],
                            ),
                            if (isSelected2) Image.asset("assets/hotspot.png"),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected3 = !isSelected3;
                    });
                  },
                  child: Container(
                    height: 72,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected3 ? orange : grey)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/circle.png"),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Foodease-0F0F_s",
                                  style: TextStyle(
                                    color: isSelected3 ? black : grey,
                                    fontSize: 15,
                                    fontFamily:
                                        isSelected3 ? 'Lexend_w' : 'Lexend',
                                  ),
                                ),
                              ],
                            ),
                            if (isSelected3) Image.asset("assets/hotspot.png"),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10)),
                                constraints: BoxConstraints(
                                  maxWidth: 400,
                                  maxHeight: 368,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Image.asset("assets/done.png"),
                                      SizedBox(height: 15),
                                      Text(
                                        "Connected Successfully!",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Lexend_w',
                                            fontSize: 24,
                                            color: black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Hurray, Your Device is connected",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: grey,
                                            fontSize: 13,
                                            fontFamily: 'Lexend'),
                                      ),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, MyRoutes.homeRoute);
                                        },
                                        child: Container(
                                          width: 295,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: orange,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "DONE",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 16,
                                                  fontFamily: 'Lexend_w',
                                                  color: black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
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
                          "CONNECT",
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'Lexend_w'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
