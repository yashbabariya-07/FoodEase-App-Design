import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:file_picker/file_picker.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class Detail {
  final String name;
  final String images;
  final String time;
  Detail({required this.name, required this.images, required this.time});
}

final List<Detail> details = [
  Detail(images: "assets/c.png", name: 'Total Time', time: '30 min'),
  Detail(images: "assets/nn.png", name: 'Number of ingredients', time: '12'),
  Detail(images: "assets/ff.png", name: 'Calories', time: '205'),
  Detail(images: "assets/pp.png", name: 'Protein', time: '120'),
  Detail(images: "assets/cc.png", name: 'Carbs', time: '180')
];

class _RecipeDetailsState extends State<RecipeDetails>
    with TickerProviderStateMixin {
  bool _isLiked = false;
  int selectedLevel = 1;
  late PageController _pageController;
  int _currentPageIndex = 0;
  int bottamtab = 1;

  bool showDetails1 = false;
  bool showDetails2 = false;
  bool showDetails3 = false;
  bool showDetails4 = false;
  bool showDetails5 = false;
  bool showDetails6 = false;
  bool showDetails7 = false;

  late TabController _tabController;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round() + 1;
      });
    });
    _controller = VideoPlayerController.asset('assets/video/food.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
      });
    _tabController = TabController(length: 3, vsync: this);
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

  int count = 0;
  bool isDecrementTapped = false;
  bool isIncrementTapped = false;
  bool isVideoVisible1 = false;
  bool isVideoVisible2 = false;
  bool isVideoVisible3 = false;
  bool isVideoVisible4 = false;

  void increment() {
    setState(() {
      count++;
      isIncrementTapped = true;
      isDecrementTapped = false;
    });
  }

  void decrement() {
    if (count < 1) {
      return;
    }
    setState(() {
      count--;
      isIncrementTapped = false;
      isDecrementTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color grey = Color(0xFF4E878C);
    const Color white = Color(0xFFFBFFFE);
    const Color yellow = Color(0xFFFBCF35);
    const Color green = Color(0xFFA9D500);
    const Color orange1 = Color(0xFFFB9435);
    const Color red = Color(0xFFFB3535);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            "recipes Details",
            style:
                TextStyle(color: black, fontSize: 20, fontFamily: 'Lexend_w'),
          ),
          centerTitle: true,
          backgroundColor: white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset("assets/share.png"),
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
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        Image.asset(
                          'assets/rd.png',
                          height: 200,
                          width: 330,
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
                                  color: Colors.grey),
                              child: Center(
                                child: Icon(
                                  _isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isLiked ? orange : white,
                                  size: 20,
                                ),
                              ),
                            ),
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
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shakshuka Straws",
                            style: TextStyle(
                                color: black,
                                fontFamily: 'lexend_w',
                                fontSize: 20)),
                        Row(
                          children: [
                            Image.asset("assets/home/im.png"),
                            SizedBox(
                              width: 5,
                            ),
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'by ',
                                  style: TextStyle(
                                      color: grey,
                                      fontFamily: 'lexend',
                                      fontSize: 13)),
                              TextSpan(
                                  text: 'Michel Methue',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'lexend',
                                      fontSize: 13))
                            ])),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset("assets/Star.png"),
                            Text("4/5 (58)",
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'lexend',
                                    fontSize: 13)),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 115,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("Add to shopping list",
                            style: TextStyle(
                                color: black,
                                fontFamily: 'lexend_w',
                                fontSize: 10)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 30,
                        child: TabBar(
                          controller: _tabController,
                          labelColor: black,
                          indicatorColor: black,
                          unselectedLabelColor: grey,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: TextStyle(
                            fontFamily: 'Lexend_w',
                            fontSize: 13,
                          ),
                          tabs: [
                            Tab(
                              text: "Description",
                            ),
                            Tab(
                              text: "Ingredients",
                            ),
                            Tab(
                              text: "Directions",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Icon(Icons.fiber_manual_record,
                                        size: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "The Indian Parsi version of this dish uses Indian green chilipeppers that are very similar to Thai birds eye chili peppers",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Lexend',
                                          color: grey),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Icon(Icons.fiber_manual_record,
                                        size: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "I used here and they also use Indian spices like turmeric,coriander powder, red chili powder and garam masala.",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Lexend',
                                          color: grey),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Icon(Icons.fiber_manual_record,
                                        size: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'I have tried to simplify it to spices that are more readily available in the U.S.. ',
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'lexend',
                                              fontSize: 13)),
                                      TextSpan(
                                          text: 'See More',
                                          style: TextStyle(
                                              color: orange,
                                              fontFamily: 'lexend',
                                              fontSize: 13))
                                    ])),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    for (var detail in details)
                                      Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(detail.images),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  detail.name,
                                                  style: TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontSize: 14,
                                                      color: black),
                                                )
                                              ],
                                            ),
                                            Text(
                                              detail.time,
                                              style: TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontSize: 12,
                                                  color: orange),
                                            )
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
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
                              SizedBox(
                                height: 15,
                              ),
                              Row(
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
                                          color: selectedLevel == 1
                                              ? black
                                              : white,
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
                                                BorderRadius.circular(20),
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
                                          color: selectedLevel == 2
                                              ? black
                                              : white,
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
                                                BorderRadius.circular(20),
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
                                          color: selectedLevel == 3
                                              ? black
                                              : white,
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
                                                BorderRadius.circular(20),
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
                                          color: selectedLevel == 4
                                              ? black
                                              : white,
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
                                                BorderRadius.circular(20),
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
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Review (58)",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 16,
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            color: grey,
                                            fontFamily: 'Lexend',
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/i1.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sara Knight",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Lexend_w',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "2 days ago",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget interdum.",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/i2.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Maily Rekson",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Lexend_w',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "2 days ago",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Image.asset("assets/mr.png")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Related Taste",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: 'Lexend_w',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            color: grey,
                                            fontFamily: 'Lexend',
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              Container(
                                height: 215,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10,
                                            bottom: 6,
                                            top: 6,
                                            left: 6),
                                        child: Container(
                                          height: 290,
                                          width: 230,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
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
                                                      child: Image.asset(
                                                          "assets/home/star.png"),
                                                    ),
                                                    Positioned(
                                                      top: 6,
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            items.elementAt(
                                                                        index)[
                                                                    'liked'] =
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: black),
                                                          child: Center(
                                                            child: Icon(
                                                              items.elementAt(index)[
                                                                          'liked'] ==
                                                                      1
                                                                  ? Icons
                                                                      .favorite
                                                                  : Icons
                                                                      .favorite_border,
                                                              color: items.elementAt(
                                                                              index)[
                                                                          'liked'] ==
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${items.elementAt(index)['name']}",
                                                          style: TextStyle(
                                                              color: black,
                                                              fontFamily:
                                                                  'Lexend_w',
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
                                                                  fontFamily:
                                                                      'Lexend',
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
                                                                  fontFamily:
                                                                      'Lexend',
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
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 295,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orange,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      "START COOKING",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'Lexend_w'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No. of people be served",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lexend',
                                        color: black),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: decrement,
                                          child: Icon(
                                            Icons.remove_circle_outline,
                                            color: isDecrementTapped
                                                ? grey
                                                : black,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("${count}"),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                          onTap: increment,
                                          child: Icon(Icons.add_circle_outline,
                                              color: isIncrementTapped
                                                  ? grey
                                                  : black)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c1.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 1',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails1 = !showDetails1;
                                              });
                                            },
                                            child: Icon(showDetails1
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (showDetails1)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Butter/oil',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                            Text(
                                              '2 Tbsp',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c2.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 2',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails2 = !showDetails2;
                                              });
                                            },
                                            child: Icon(showDetails2
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (showDetails2)
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Medium Onion (finely diced)',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                                Text(
                                                  '1/2',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Garlic (minced)',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                                Text(
                                                  '1 tsp',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Ginger (minced)',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                                Text(
                                                  '1 tsp',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'medium Tomatoes (diced)',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                                Text(
                                                  '4',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: grey,
                                                      fontFamily: 'Lexend'),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c3.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 3',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails3 = !showDetails3;
                                              });
                                            },
                                            child: Icon(showDetails3
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (showDetails3)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Smoked Paprika',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                            Text(
                                              '1 tsp',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c4.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 4',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails4 = !showDetails4;
                                              });
                                            },
                                            child: Icon(showDetails4
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (showDetails4)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Fresh Cilantro (chopped)',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                            Text(
                                              '1/2 Cup',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c5.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 5',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails5 = !showDetails5;
                                              });
                                            },
                                            child: Icon(showDetails5
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (showDetails5)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Crispy Potato Straws',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                            Text(
                                              '1.5- 2 Cups',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c6.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 6',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails6 = !showDetails6;
                                              });
                                            },
                                            child: Icon(showDetails6
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (showDetails6)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Eggs',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                            Text(
                                              '2 Tbsp',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: grey,
                                                  fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c7.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 7',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showDetails7 = !showDetails7;
                                              });
                                            },
                                            child: Icon(
                                              showDetails7
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color:
                                                  showDetails7 ? black : grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Review (58)",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 16,
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            color: grey,
                                            fontFamily: 'Lexend',
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/i1.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sara Knight",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Lexend_w',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "2 days ago",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget interdum.",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/i2.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Maily Rekson",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Lexend_w',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "2 days ago",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Image.asset("assets/mr.png")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Related Taste",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: 'Lexend_w',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            color: grey,
                                            fontFamily: 'Lexend',
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              Container(
                                height: 215,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10,
                                            bottom: 6,
                                            top: 6,
                                            left: 6),
                                        child: Container(
                                          height: 290,
                                          width: 230,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
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
                                                      child: Image.asset(
                                                          "assets/home/star.png"),
                                                    ),
                                                    Positioned(
                                                      top: 6,
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            items.elementAt(
                                                                        index)[
                                                                    'liked'] =
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: black),
                                                          child: Center(
                                                            child: Icon(
                                                              items.elementAt(index)[
                                                                          'liked'] ==
                                                                      1
                                                                  ? Icons
                                                                      .favorite
                                                                  : Icons
                                                                      .favorite_border,
                                                              color: items.elementAt(
                                                                              index)[
                                                                          'liked'] ==
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${items.elementAt(index)['name']}",
                                                          style: TextStyle(
                                                              color: black,
                                                              fontFamily:
                                                                  'Lexend_w',
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
                                                                  fontFamily:
                                                                      'Lexend',
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
                                                                  fontFamily:
                                                                      'Lexend',
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
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 295,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orange,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      "START COOKING",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'Lexend_w'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Read aloud Direction',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                  Image.asset("assets/sound.png")
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Step 1',
                                    style: TextStyle(
                                      fontFamily: 'Lexend_w',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                  Text(
                                    '1.5 min',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c1.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 1',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '30°C',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Lexend',
                                                color: orange),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Butter/oil',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: grey,
                                                fontFamily: 'Lexend'),
                                          ),
                                          Text(
                                            '2 Tbsp',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: grey,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'To prepare the ingredients, finely dice/ mince the Onion, garlic, ginger, chili pepper, cilantro & Tomatoes',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: grey,
                                                fontFamily: 'Lexend'),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Image.asset("assets/sss.png"),
                                              Positioned(
                                                top: 70,
                                                left: 130,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isVideoVisible1 =
                                                          !isVideoVisible1;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                      "assets/vc.png"),
                                                ),
                                              ),
                                              Visibility(
                                                visible: isVideoVisible1,
                                                child: Center(
                                                  child: _controller
                                                          .value.isInitialized
                                                      ? Container(
                                                          height: 180,
                                                          width: 330,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  _controller
                                                                      .value
                                                                      .aspectRatio,
                                                              child: VideoPlayer(
                                                                  _controller),
                                                            ),
                                                          ),
                                                        )
                                                      : CircularProgressIndicator(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 130,
                                                top: 70,
                                                child: Visibility(
                                                  visible: isVideoVisible1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_controller
                                                            .value.isPlaying) {
                                                          _controller.pause();
                                                        } else {
                                                          _controller.play();
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      _controller
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      size: 50.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Step 2',
                                    style: TextStyle(
                                      fontFamily: 'Lexend_w',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                  Text(
                                    '1.5 min',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c2.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 2',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '30°C',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Lexend',
                                                color: orange),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Medium Onion (finely diced)',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                              Text(
                                                '1/2',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Garlic (minced)',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                              Text(
                                                '1 tsp',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Ginger (minced)',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                              Text(
                                                '1 tsp',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'medium Tomatoes (diced)',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                              Text(
                                                '4',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'To prepare the ingredients, finely dice/ mince the Onion, garlic, ginger, chili pepper, cilantro & Tomatoes',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: grey,
                                                fontFamily: 'Lexend'),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Image.asset("assets/sss.png"),
                                              Positioned(
                                                top: 70,
                                                left: 130,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isVideoVisible2 =
                                                          !isVideoVisible2;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                      "assets/vc.png"),
                                                ),
                                              ),
                                              Visibility(
                                                visible: isVideoVisible2,
                                                child: Center(
                                                  child: _controller
                                                          .value.isInitialized
                                                      ? Container(
                                                          height: 180,
                                                          width: 330,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  _controller
                                                                      .value
                                                                      .aspectRatio,
                                                              child: VideoPlayer(
                                                                  _controller),
                                                            ),
                                                          ),
                                                        )
                                                      : CircularProgressIndicator(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 130,
                                                top: 70,
                                                child: Visibility(
                                                  visible: isVideoVisible2,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_controller
                                                            .value.isPlaying) {
                                                          _controller.pause();
                                                        } else {
                                                          _controller.play();
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      _controller
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      size: 50.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Step 3',
                                    style: TextStyle(
                                      fontFamily: 'Lexend_w',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                  Text(
                                    '1.5 min',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/str1.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Stirring',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '30°C',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Lexend',
                                                color: orange),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'To prepare the ingredients, finely dice/ mince the Onion, garlic, ginger, chili pepper, cilantro & Tomatoes',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: grey,
                                                fontFamily: 'Lexend'),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Image.asset("assets/sss.png"),
                                              Positioned(
                                                top: 70,
                                                left: 130,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isVideoVisible3 =
                                                          !isVideoVisible3;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                      "assets/vc.png"),
                                                ),
                                              ),
                                              Visibility(
                                                visible: isVideoVisible3,
                                                child: Center(
                                                  child: _controller
                                                          .value.isInitialized
                                                      ? Container(
                                                          height: 180,
                                                          width: 330,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  _controller
                                                                      .value
                                                                      .aspectRatio,
                                                              child: VideoPlayer(
                                                                  _controller),
                                                            ),
                                                          ),
                                                        )
                                                      : CircularProgressIndicator(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 130,
                                                top: 70,
                                                child: Visibility(
                                                  visible: isVideoVisible3,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_controller
                                                            .value.isPlaying) {
                                                          _controller.pause();
                                                        } else {
                                                          _controller.play();
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      _controller
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      size: 50.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Step 4',
                                    style: TextStyle(
                                      fontFamily: 'Lexend_w',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                  Text(
                                    '1.5 min',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 325,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/c3.png'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Container 3',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend_w',
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '30°C',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Lexend',
                                                color: orange),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Thai Chilli Pepper (finely sliced)',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                              Text(
                                                '1/2',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Smoked Paprika',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                              Text(
                                                '1 tsp',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: grey,
                                                    fontFamily: 'Lexend'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'To prepare the ingredients, finely dice/ mince the Onion, garlic, ginger, chili pepper, cilantro & Tomatoes',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: grey,
                                                fontFamily: 'Lexend'),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Image.asset("assets/sss.png"),
                                              Positioned(
                                                top: 70,
                                                left: 130,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isVideoVisible4 =
                                                          !isVideoVisible4;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                      "assets/vc.png"),
                                                ),
                                              ),
                                              Visibility(
                                                visible: isVideoVisible4,
                                                child: Center(
                                                  child: _controller
                                                          .value.isInitialized
                                                      ? Container(
                                                          height: 180,
                                                          width: 330,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  _controller
                                                                      .value
                                                                      .aspectRatio,
                                                              child: VideoPlayer(
                                                                  _controller),
                                                            ),
                                                          ),
                                                        )
                                                      : CircularProgressIndicator(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 130,
                                                top: 70,
                                                child: Visibility(
                                                  visible: isVideoVisible4,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_controller
                                                            .value.isPlaying) {
                                                          _controller.pause();
                                                        } else {
                                                          _controller.play();
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      _controller
                                                              .value.isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      size: 50.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Review (58)",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 16,
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            color: grey,
                                            fontFamily: 'Lexend',
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/i1.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sara Knight",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Lexend_w',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "2 days ago",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget interdum.",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/i2.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Maily Rekson",
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Lexend_w',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "2 days ago",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur",
                                          style: TextStyle(
                                              color: grey,
                                              fontFamily: 'Lexend',
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Image.asset("assets/mr.png")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Related Taste",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontFamily: 'Lexend_w',
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            color: grey,
                                            fontFamily: 'Lexend',
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                              Container(
                                height: 215,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10,
                                            bottom: 6,
                                            top: 6,
                                            left: 6),
                                        child: Container(
                                          height: 290,
                                          width: 230,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
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
                                                      child: Image.asset(
                                                          "assets/home/star.png"),
                                                    ),
                                                    Positioned(
                                                      top: 6,
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            items.elementAt(
                                                                        index)[
                                                                    'liked'] =
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: black),
                                                          child: Center(
                                                            child: Icon(
                                                              items.elementAt(index)[
                                                                          'liked'] ==
                                                                      1
                                                                  ? Icons
                                                                      .favorite
                                                                  : Icons
                                                                      .favorite_border,
                                                              color: items.elementAt(
                                                                              index)[
                                                                          'liked'] ==
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${items.elementAt(index)['name']}",
                                                          style: TextStyle(
                                                              color: black,
                                                              fontFamily:
                                                                  'Lexend_w',
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
                                                                  fontFamily:
                                                                      'Lexend',
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
                                                                  fontFamily:
                                                                      'Lexend',
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
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return RateBox();
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
                                      "START COOKING",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'Lexend_w'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
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

class RateBox extends StatefulWidget {
  const RateBox({super.key});

  @override
  State<RateBox> createState() => _RateBoxState();
}

class _RateBoxState extends State<RateBox> {
  // File? img;
  // File? video;
  // final picker = ImagePicker();
  // getImage() async {
  //   final pickedImg = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedImg != null) {
  //       img = File(pickedImg.path);
  //     } else {
  //       print("no image selected");
  //     }
  //   });
  // }

  File? mediaFile;
  final picker = FilePicker.platform;
  VideoPlayerController? videoController;

  Future getMedia() async {
    FilePickerResult? pickedMedia = await picker.pickFiles(
      type: FileType.media,
      allowMultiple: false,
    );

    setState(() {
      if (pickedMedia != null) {
        mediaFile = File(pickedMedia.files.single.path!);
        if (mediaFile != null && mediaFile!.path.endsWith('.mp4')) {
          videoController = VideoPlayerController.file(mediaFile!)
            ..initialize().then((_) {
              setState(() {});
              videoController!.play();
              //  videoController?.setLooping(true);
            });
        }
      } else {
        print("no media selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color black = Color(0xFF222222);
    const Color orange = Color(0xFFF8AC46);
    const Color white = Color(0xFFFBFFFE);
    const Color grey = Color(0xFF4E878C);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          height: 544,
          width: 348,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MyRoutes.recipeDetailsRoute);
                        },
                        child: Image.asset('assets/ccircle.png'),
                      ),
                    ],
                  ),
                  Text(
                    "Rate this Recipes",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Lexend_w',
                        fontSize: 18,
                        color: black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Give Feedback for this food",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: grey,
                        fontSize: 12,
                        fontFamily: 'Lexend'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RatingBar(
                    glow: false,
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 6),
                    ratingWidget: RatingWidget(
                      full: Image.asset('assets/ostar.png'),
                      empty: Image.asset('assets/bstar.png'),
                      half: Image.asset('assets/ostar.png'),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintText: 'Write here... ',
                            hintStyle: TextStyle(
                                color: grey,
                                fontFamily: 'Lexend',
                                fontSize: 13),
                            border: InputBorder.none,
                            fillColor: white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: DottedBorder(
                          color: orange,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              getMedia();
                            },
                            child: mediaFile == null
                                ? Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: orange,
                                        )),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: orange,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                : mediaFile!.path.endsWith('.mp4')
                                    ? videoController != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 120,
                                              width: 130,
                                              child: Container(
                                                  child: VideoPlayer(
                                                videoController!,
                                              )),
                                            ),
                                          )
                                        : CircularProgressIndicator()
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          mediaFile!,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 130,
                                        ),
                                      ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Material(
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Drop your recipe Image/Video or browse",
                                style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 14,
                                    color: orange),
                              ),
                              Text(
                                "PNG, JPG, JPEG, MP4 (Size 320x150 or max 5mb)",
                                style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 11,
                                    color: black),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
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
                          "POST",
                          style: TextStyle(
                              decoration: TextDecoration.none,
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
        ),
      ),
    );
  }
}
