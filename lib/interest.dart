import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InteresState();
}

class _InteresState extends State<Interest> {
  List cuisine = [
    {"image": "assets/interest/10.png", "name": "Indian"},
    {"image": "assets/interest/chinese.png", "name": "Chinese"},
    {"image": "assets/interest/2.png", "name": "Thai"},
    {"image": "assets/interest/african.png", "name": "African"},
    {"image": "assets/interest/4.png", "name": "American"},
    {"image": "assets/interest/5.png", "name": "Asian"},
    {"image": "assets/interest/6.png", "name": "British"},
    {"image": "assets/interest/7.png", "name": "Caribbean"},
    {"image": "assets/interest/8.png", "name": "Eastern European"},
    {"image": "assets/interest/9.png", "name": "French"},
  ];

  String? groupvalue = "Veg";
  int selectedLevel = 1;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;
  bool isSelected7 = false;
  bool isSelected8 = false;
  bool isSelected9 = false;
  bool isSelected10 = false;
  bool isSelected11 = false;
  bool isSelected12 = false;
  bool isSelected13 = false;
  bool isSelected14 = false;
  bool isSelected15 = false;

  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color white = Color(0xFFFBFFFE);
    const Color grey = Color(0xFF4E878C);

    const Color yellow = Color(0xFFFBCF35);
    const Color green = Color(0xFFA9D500);
    const Color orange1 = Color(0xFFFB9435);
    const Color red = Color(0xFFFB3535);

    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 30),
            child: Column(
              children: [
                Image.asset("assets/foodease.png"),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 350,
                    height: 1190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Interest",
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
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cuisine",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: 'Lexend_w'),
                                ),
                                Text(
                                  "You can choose maximum 5 Preference.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: grey,
                                      fontSize: 12,
                                      fontFamily: 'Lexend'),
                                ),
                                SizedBox(
                                  height: 350,
                                  child: GridView.builder(
                                      itemCount: cuisine.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 0.69,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Image.asset(
                                              "${cuisine.elementAt(index)['image']}",
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "${cuisine.elementAt(index)['name']}",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Lexend',
                                                  fontSize: 13),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.wifiRoute);
                              },
                              child: Container(
                                width: 310,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orange,
                                ),
                                child: Center(
                                  child: Text(
                                    "CONTINUE",
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'Lexend_w'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Do you eat ?",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: 'Lexend_w'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: orange,
                                          value: "Veg",
                                          groupValue: groupvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupvalue = value!;
                                            });
                                          }),
                                      const Text(
                                        "Veg",
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
                                          value: "Non-Veg",
                                          groupValue: groupvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupvalue = value!;
                                            });
                                          }),
                                      const Text(
                                        "Non-Veg",
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
                                          value: "Vegan",
                                          groupValue: groupvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupvalue = value!;
                                            });
                                          }),
                                      const Text(
                                        "Vegan",
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
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Spicy level",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: 'Lexend'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 76,
                                      decoration: BoxDecoration(
                                          color: green,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 1;
                                        });
                                      },
                                      child: Container(
                                        height: 15,
                                        width: 1,
                                        color:
                                            selectedLevel == 1 ? black : white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 1;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: selectedLevel == 1
                                              ? black
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "Mild",
                                            style: TextStyle(
                                                color: selectedLevel == 1
                                                    ? white
                                                    : black,
                                                fontFamily: 'Lexend',
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 76,
                                      decoration: BoxDecoration(
                                          color: yellow,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 2;
                                        });
                                      },
                                      child: Container(
                                        height: 15,
                                        width: 1,
                                        color:
                                            selectedLevel == 2 ? black : white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 2;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: selectedLevel == 2
                                              ? black
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "Medium",
                                            style: TextStyle(
                                                color: selectedLevel == 2
                                                    ? white
                                                    : black,
                                                fontFamily: 'Lexend',
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 76,
                                      decoration: BoxDecoration(
                                          color: orange1,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 3;
                                        });
                                      },
                                      child: Container(
                                        height: 15,
                                        width: 1,
                                        color:
                                            selectedLevel == 3 ? black : white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 3;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: selectedLevel == 3
                                              ? black
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "Hot",
                                            style: TextStyle(
                                              color: selectedLevel == 3
                                                  ? white
                                                  : black,
                                              fontSize: 14,
                                              fontFamily: 'Lexend',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 77,
                                      decoration: BoxDecoration(
                                          color: red,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 4;
                                        });
                                      },
                                      child: Container(
                                        height: 15,
                                        width: 1,
                                        color:
                                            selectedLevel == 4 ? black : white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedLevel = 4;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: selectedLevel == 4
                                              ? black
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "Hell",
                                            style: TextStyle(
                                              color: selectedLevel == 4
                                                  ? white
                                                  : black,
                                              fontSize: 14,
                                              fontFamily: 'Lexend',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Any ingredient allergies\nor intolerances ?",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Lexend'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected1 = !isSelected1;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 73,
                                    decoration: BoxDecoration(
                                        color: isSelected1
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected1
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Gluten",
                                        style: TextStyle(
                                          color: isSelected1 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected1
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected2 = !isSelected2;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 67,
                                    decoration: BoxDecoration(
                                        color: isSelected2
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected2
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Dairy",
                                        style: TextStyle(
                                          color: isSelected2 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected2
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected3 = !isSelected3;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: isSelected3
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected3
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Egg",
                                        style: TextStyle(
                                          color: isSelected3 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected3
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected4 = !isSelected4;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: isSelected4
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected4
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Soy",
                                        style: TextStyle(
                                          color: isSelected4 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected4
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected5 = !isSelected5;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 76,
                                    decoration: BoxDecoration(
                                        color: isSelected5
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected5
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Peanut",
                                        style: TextStyle(
                                          color: isSelected5 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected5
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected6 = !isSelected6;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 86,
                                    decoration: BoxDecoration(
                                        color: isSelected6
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected6
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Tree Nut",
                                        style: TextStyle(
                                          color: isSelected6 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected6
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected7 = !isSelected7;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 56,
                                    decoration: BoxDecoration(
                                        color: isSelected7
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected7
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Fish",
                                        style: TextStyle(
                                          color: isSelected7 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected7
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected8 = !isSelected8;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 85,
                                    decoration: BoxDecoration(
                                        color: isSelected8
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected8
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Shellfish",
                                        style: TextStyle(
                                          color: isSelected8 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected8
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Any dislike about taste ? ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Lexend'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected9 = !isSelected9;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: isSelected9
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected9
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Sweet",
                                        style: TextStyle(
                                          color: isSelected9 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected9
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected10 = !isSelected10;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 68,
                                    decoration: BoxDecoration(
                                        color: isSelected10
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected10
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Bitter",
                                        style: TextStyle(
                                          color: isSelected10 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected10
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected11 = !isSelected11;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: isSelected11
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected11
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Sour",
                                        style: TextStyle(
                                          color: isSelected11 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected11
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected12 = !isSelected12;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 63,
                                    decoration: BoxDecoration(
                                        color: isSelected12
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected12
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Salty",
                                        style: TextStyle(
                                          color: isSelected12 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected4
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected13 = !isSelected13;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 132,
                                    decoration: BoxDecoration(
                                        color: isSelected13
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected13
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Meaty (umami)",
                                        style: TextStyle(
                                          color: isSelected13 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected13
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected14 = !isSelected14;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 59,
                                    decoration: BoxDecoration(
                                        color: isSelected14
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected14
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Cool",
                                        style: TextStyle(
                                          color: isSelected14 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected14
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected15 = !isSelected15;
                                    });
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 53,
                                    decoration: BoxDecoration(
                                        color: isSelected15
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected15
                                                ? Colors.transparent
                                                : grey)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Hot",
                                        style: TextStyle(
                                          color: isSelected15 ? black : grey,
                                          fontSize: 14,
                                          fontFamily: isSelected15
                                              ? 'Lexend_w'
                                              : 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
