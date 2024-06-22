import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  String weightSelected = 'LBS';
  String heightSelected = 'FEET';

  void weightSelect(String option) {
    setState(() {
      weightSelected = option;
    });
  }

  void heightSelect(String option) {
    setState(() {
      heightSelected = option;
    });
  }

  int selectedIndex = 0;

  List<int> data = [
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];
  String? groupvalue = "Yes";

  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color white = Color(0xFFFBFFFE);
    const Color grey = Color(0xFF4E878C);

    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Image.asset("assets/foodease.png"),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 350,
                  height: 510,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Personal Info",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: black,
                                    fontSize: 30,
                                    fontFamily: 'Lexend_w'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              height: 50,
                              width: 295,
                              decoration: BoxDecoration(
                                border: Border.all(color: grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Weight",
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 14,
                                          color: grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 135),
                                    child: Container(
                                      height: 36,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: grey,
                                        border: Border.all(color: grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              weightSelect('LBS');
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 42,
                                              decoration: BoxDecoration(
                                                color: weightSelected == 'LBS'
                                                    ? white
                                                    : grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'LBS',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lexend',
                                                  color: weightSelected == 'LBS'
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              weightSelect('KG');
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 42,
                                              decoration: BoxDecoration(
                                                color: weightSelected == 'KG'
                                                    ? white
                                                    : grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'KG',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lexend',
                                                  color: weightSelected == 'KG'
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              height: 50,
                              width: 295,
                              decoration: BoxDecoration(
                                border: Border.all(color: grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Height",
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 14,
                                          color: grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 135),
                                    child: Container(
                                      height: 36,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: grey,
                                        border: Border.all(color: grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              heightSelect('FEET');
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 42,
                                              decoration: BoxDecoration(
                                                color: heightSelected == 'FEET'
                                                    ? white
                                                    : grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'FEET',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lexend',
                                                  color:
                                                      heightSelected == 'FEET'
                                                          ? Colors.black
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              heightSelect('CM');
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 42,
                                              decoration: BoxDecoration(
                                                color: heightSelected == 'CM'
                                                    ? white
                                                    : grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'CM',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lexend',
                                                  color: heightSelected == 'CM'
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Age",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 16,
                                        fontFamily: 'Lexend_w'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 250,
                                height: 32,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    double fontSize;
                                    int distance =
                                        (index - selectedIndex).abs();
                                    Color textColor = Colors.black;

                                    if (distance == 0) {
                                      fontSize = 22.0;
                                      textColor = Colors.black;
                                    } else if (distance == 1) {
                                      fontSize = 18.0;
                                      textColor = Colors.black;
                                    } else if (distance == 2) {
                                      fontSize = 16.0;
                                      textColor = Colors.grey.shade800;
                                    } else {
                                      fontSize = 12.0;
                                      textColor = Colors.grey.shade600;
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: selectedIndex == index
                                              ? orange
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${data[index]}",
                                            style: TextStyle(
                                              fontFamily: selectedIndex == index
                                                  ? 'Lexend_w'
                                                  : 'Lexend',
                                              fontSize: fontSize,
                                              color: textColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Regulating Diet",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontFamily: 'Lexend_w'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: orange,
                                        value: "Yes",
                                        groupValue: groupvalue,
                                        onChanged: (value) {
                                          setState(() {
                                            groupvalue = value!;
                                          });
                                        }),
                                    const Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Lexend',
                                          color: black),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Radio(
                                        activeColor: orange,
                                        value: "No",
                                        groupValue: groupvalue,
                                        onChanged: (value) {
                                          setState(() {
                                            groupvalue = value!;
                                          });
                                        }),
                                    const Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Lexend',
                                          color: black),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.interestRoute);
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
                                  "REGISTER",
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Lexend_w'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
