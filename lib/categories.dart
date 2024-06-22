import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int bottamtab = 1;
  List meals = [
    {"image": "assets/home/B.png", "name": "Breakfast"},
    {"image": "assets/home/L.png", "name": "Lunch"},
    {"image": "assets/home/Snack.png", "name": "Snacking"},
    {"image": "assets/home/Dinner.png", "name": "Dinner"},
    {"image": "assets/home/veg.png", "name": "Veg."},
    {"image": "assets/home/nveg.png", "name": "Non veg."},
  ];
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
  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color grey = Color(0xFF4E878C);
    const Color white = Color(0xFFFBFFFE);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            "Categories",
            style:
                TextStyle(color: black, fontSize: 20, fontFamily: 'Lexend_w'),
          ),
          centerTitle: true,
          backgroundColor: white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset("assets/s.png"),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: orange),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meals",
                  style: TextStyle(
                      color: black, fontSize: 18, fontFamily: 'Lexend_w'),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                      itemCount: meals.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.80,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              "${meals.elementAt(index)['image']}",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${meals.elementAt(index)['name']}",
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Lexend',
                                  fontSize: 14),
                            ),
                          ],
                        );
                      }),
                ),
                Text(
                  "Cuisine",
                  style: TextStyle(
                      color: black, fontSize: 18, fontFamily: 'Lexend_w'),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 380,
                  child: GridView.builder(
                      itemCount: cuisine.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
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
                                  fontSize: 14),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: orange,
          onPressed: () {},
          child: Image.asset("assets/home/plus.png"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              height: 65,
              color: white,
              child: BottomAppBar(
                color: white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bottamtab = 1;
                            });
                          },
                          child: Container(
                              child: Image.asset(
                            "assets/home/home.png",
                            color: bottamtab == 1 ? orange : grey,
                          )),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 12,
                            color: bottamtab == 1 ? orange : grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bottamtab = 2;
                            });
                          },
                          child: Container(
                              child: Image.asset(
                            "assets/home/recipe.png",
                            color: bottamtab == 2 ? orange : grey,
                          )),
                        ),
                        Text(
                          'Recipe',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 12,
                            color: bottamtab == 2 ? orange : grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bottamtab = 3;
                            });
                          },
                          child: Container(
                              child: Image.asset(
                            "assets/home/shoping.png",
                            color: bottamtab == 3 ? orange : grey,
                          )),
                        ),
                        Text(
                          'Shoping List',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 12,
                            color: bottamtab == 3 ? orange : grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bottamtab = 4;
                            });
                          },
                          child: Container(
                              child: Image.asset(
                            "assets/home/user-octagon.png",
                            color: bottamtab == 4 ? orange : grey,
                          )),
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 12,
                            color: bottamtab == 4 ? orange : grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
