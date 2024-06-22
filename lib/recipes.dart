import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool _isLiked = false;
  bool _isLikedidea = false;
  late PageController _pageController;
  int _currentPageIndex = 0;
  int bottamtab = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round() + 1;
      });
    });
  }

  final List<Map<String, dynamic>> items = [
    {
      "images": "assets/home/pasta.png",
      'name': 'Roasted Warm Stater Salad',
      "img1": "assets/home/clock.png",
      "time": "20 min",
      "img2": "assets/home/ing.png",
      "ing": "11 Ingredients",
      "liked": 0
    },
    {
      "images": "assets/home/pasta.png",
      'name': 'Veggie Jetsetter',
      "img1": "assets/home/clock.png",
      "time": "1.20 hr",
      "img2": "assets/home/ing.png",
      "ing": "11 Ingredients",
      "liked": 0
    },
  ];

  final List<Map<String, dynamic>> gridMap = [
    {
      "images": "assets/home/11.png",
      "title": "Soba Noodle Chicken Salad",
      "img1": "assets/home/clock.png",
      "time": "20 min",
      "img2": "assets/home/ing.png",
      "ing": "11 Ingredients",
      "liked": 0
    },
    {
      "images": "assets/home/12.png",
      "title": "Vegan Mapo Tofu",
      "img1": "assets/home/clock.png",
      "time": "20 min",
      "img2": "assets/home/ing.png",
      "ing": "11 Ingredients",
      "liked": 0
    },
    {
      "images": "assets/home/13.png",
      "title": "Roasted Warm Stater Salad",
      "img1": "assets/home/clock.png",
      "time": "20 min",
      "img2": "assets/home/ing.png",
      "ing": "11 Ingredients",
      "liked": 0
    },
    {
      "images": "assets/home/14.png",
      "title": "Roasted Warm Stater Salad",
      "img1": "assets/home/clock.png",
      "time": "20 min",
      "img2": "assets/home/ing.png",
      "ing": "11 Ingredients",
      "liked": 0
    },
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
            "Recipes",
            style:
                TextStyle(color: black, fontSize: 20, fontFamily: 'Lexend_w'),
          ),
          centerTitle: true,
          backgroundColor: white,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Image.asset("assets/s.png"),
                      suffixIcon: Image.asset("assets/d.png"),
                      hintText: "Search meal, recipe, & more",
                      hintStyle: TextStyle(
                          color: grey, fontFamily: 'Lexend', fontSize: 14),
                      contentPadding: EdgeInsets.all(10)),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        Image.asset(
                          'assets/home/products.png',
                          height: 200,
                          width: 320,
                        ),
                        Positioned(
                          top: 20,
                          left: 15,
                          child: Image.asset("assets/home/star.png"),
                        ),
                        Positioned(
                          top: 20,
                          right: 15,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: black),
                              child: Center(
                                child: Icon(
                                  _isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isLiked ? Colors.red : white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 96,
                                height: 19,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: orange),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    "Recipe of the day",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontSize: 10,
                                        color: black),
                                  ),
                                ),
                              ),
                              Text(
                                "Chicken Matzo Ball Stew",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Lexend_w',
                                    color: white),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: -10,
                          child: Image.asset("assets/home/cup.png"),
                        ),
                        Positioned(
                          left: 15,
                          top: 160,
                          child: Row(
                            children: [
                              Image.asset("assets/home/im.png"),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "by Michel Methue",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lexend',
                                    color: white),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 160,
                          child: Text(
                            '$_currentPageIndex/6',
                            style: TextStyle(
                                color: white,
                                fontFamily: 'Lexend',
                                fontSize: 12),
                          ),
                        )
                      ]);
                    },
                    controller: _pageController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today’s Meal",
                      style: TextStyle(
                          fontFamily: 'Lexend', fontSize: 18, color: black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.recipeDetailsRoute);
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: grey, fontFamily: 'Lexend', fontSize: 12),
                        ))
                  ],
                ),
                Container(
                  height: 215,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 10, bottom: 6, top: 6, left: 6),
                          child: Container(
                            height: 290,
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                          "${items.elementAt(index)['images']}"),
                                      Positioned(
                                        top: 6,
                                        left: 10,
                                        child:
                                            Image.asset("assets/home/star.png"),
                                      ),
                                      Positioned(
                                        top: 6,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              items.elementAt(index)['liked'] =
                                                  items.elementAt(
                                                              index)['liked'] ==
                                                          1
                                                      ? 0
                                                      : 1;
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: black),
                                            child: Center(
                                              child: Icon(
                                                items.elementAt(
                                                            index)['liked'] ==
                                                        1
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: items.elementAt(
                                                            index)['liked'] ==
                                                        1
                                                    ? orange
                                                    : white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${items.elementAt(index)['name']}",
                                            style: TextStyle(
                                                color: black,
                                                fontFamily: 'Lexend_w',
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "${items.elementAt(index)['img1']}"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${items.elementAt(index)['time']}",
                                                style: TextStyle(
                                                    color: grey,
                                                    fontFamily: 'Lexend',
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset(
                                                  "${items.elementAt(index)['img2']}"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${items.elementAt(index)['ing']}",
                                                style: TextStyle(
                                                    color: grey,
                                                    fontFamily: 'Lexend',
                                                    fontSize: 12),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weekend Breakfast Ideas",
                      style: TextStyle(
                          fontFamily: 'Lexend', fontSize: 18, color: black),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: grey, fontFamily: 'Lexend', fontSize: 12),
                        ))
                  ],
                ),
                Container(
                  height: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Image.asset("assets/home/msh.png"),
                            Positioned(
                              top: 6,
                              left: 10,
                              child: Image.asset("assets/home/star.png"),
                            ),
                            Positioned(
                              top: 6,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isLikedidea = !_isLikedidea;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: black),
                                  child: Center(
                                    child: Icon(
                                      _isLikedidea
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: _isLikedidea ? orange : white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Roasted Warm Stater Salad",
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Lexend_w',
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/home/clock.png"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "20 min",
                                      style: TextStyle(
                                          color: grey,
                                          fontFamily: 'Lexend',
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset("assets/home/ing.png"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "11 Ingredients",
                                      style: TextStyle(
                                          color: grey,
                                          fontFamily: 'Lexend',
                                          fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "COOK",
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Lexend_w',
                                      fontSize: 14),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                          fontFamily: 'Lexend', fontSize: 18, color: black),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: grey, fontFamily: 'Lexend', fontSize: 12),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 410,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                            mainAxisExtent: 250),
                        itemCount: gridMap.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(children: [
                                      Image.asset(
                                          "${gridMap.elementAt(index)['images']}"),
                                      Positioned(
                                        top: 6,
                                        left: 8,
                                        child:
                                            Image.asset("assets/home/star.png"),
                                      ),
                                      Positioned(
                                          top: 6,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                gridMap.elementAt(
                                                        index)['liked'] =
                                                    gridMap.elementAt(index)[
                                                                'liked'] ==
                                                            1
                                                        ? 0
                                                        : 1;
                                              });
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: black),
                                              child: Center(
                                                child: Icon(
                                                  gridMap.elementAt(
                                                              index)['liked'] ==
                                                          1
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: gridMap.elementAt(
                                                              index)['liked'] ==
                                                          1
                                                      ? orange
                                                      : white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ))
                                    ]),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 45,
                                          child: Text(
                                            "${gridMap.elementAt(index)['title']}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Lexend_w',
                                                fontSize: 15,
                                                color: black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "${gridMap.elementAt(index)['img1']}"),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${gridMap.elementAt(index)['time']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontSize: 12,
                                                  color: grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "${gridMap.elementAt(index)['img2']}"),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${gridMap.elementAt(index)['ing']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontSize: 12,
                                                  color: grey),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
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
