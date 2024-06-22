import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color white = Color(0xFFFBFFFE);
    const Color grey = Color(0xFF4E878C);
    const Color borderColor = Color(0xFFF3F3F3);
    const Color shadow = Color(0xFFD3D4E2);

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
                    height: 760,
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
                                  "Register ",
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 50,
                              width: 295,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: orange, width: 2)),
                                  prefixIcon: Image.asset(
                                    "assets/icons/user.png",
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      color: grey, fontFamily: 'Lexend'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 50,
                                    width: 142.5,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(2),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: orange, width: 2)),
                                        prefixIcon: Image.asset(
                                          "assets/icons/user.png",
                                        ),
                                        hintText: "First Name",
                                        hintStyle: TextStyle(
                                            color: grey, fontFamily: 'Lexend'),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Flexible(
                                  child: Container(
                                    height: 50,
                                    width: 142.5,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(2),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: orange,
                                          width: 2,
                                        )),
                                        prefixIcon: Image.asset(
                                          "assets/icons/user.png",
                                        ),
                                        hintText: "Last Name",
                                        hintStyle: TextStyle(
                                            color: grey, fontFamily: 'Lexend'),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 50,
                              width: 295,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: orange, width: 2)),
                                  prefixIcon: Image.asset(
                                    "assets/icons/Message.png",
                                  ),
                                  hintText: "abc12@gmail.com",
                                  hintStyle: TextStyle(
                                      color: grey, fontFamily: 'Lexend'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 50,
                              width: 295,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: orange, width: 2)),
                                  prefixIcon: Image.asset(
                                    "assets/icons/Lock.png",
                                  ),
                                  hintText: "Your Password",
                                  hintStyle: TextStyle(
                                      color: grey, fontFamily: 'Lexend'),
                                  suffixIcon: Image.asset(
                                    "assets/icons/Hidden.png",
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 50,
                              width: 295,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: orange, width: 2)),
                                  prefixIcon: Image.asset(
                                    "assets/icons/Lock.png",
                                  ),
                                  hintText: "Your re-password",
                                  hintStyle: TextStyle(
                                      color: grey, fontFamily: 'Lexend'),
                                  suffixIcon: Image.asset(
                                    "assets/icons/Hidden.png",
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 295,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orange,
                                ),
                                child: Center(
                                  child: Text(
                                    "NEXT",
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'Lexend_w'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 105,
                                height: 1,
                                color: grey,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                      color: grey, fontFamily: 'Lexend'),
                                ),
                              ),
                              Container(
                                width: 105,
                                height: 1,
                                color: grey,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: shadow,
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: borderColor,
                                    child: CircleAvatar(
                                      backgroundColor: white,
                                      radius: 23,
                                      child: Center(
                                        child: Image.asset(
                                          "assets/g.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: shadow,
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: borderColor,
                                    child: CircleAvatar(
                                      backgroundColor: white,
                                      radius: 24,
                                      child: Center(
                                        child: Image.asset(
                                          "assets/f.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: shadow,
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: borderColor,
                                    child: CircleAvatar(
                                      backgroundColor: white,
                                      radius: 24,
                                      child: Center(
                                        child: Image.asset(
                                          "assets/i.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(fontFamily: 'Lexend'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.loginRoute);
                                  },
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontFamily: 'Lexend'),
                                  ))
                            ],
                          )
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
