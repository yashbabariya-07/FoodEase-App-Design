import 'package:flutter/material.dart';
import 'package:food_app/categories.dart';
import 'package:food_app/home_page.dart';
import 'package:food_app/interest.dart';

import 'package:food_app/login_page.dart';
import 'package:food_app/personal_info.dart';
import 'package:food_app/recipes.dart';
import 'package:food_app/recipes_details.dart';
import 'package:food_app/signup_page.dart';
import 'package:food_app/utils/routes.dart';
import 'package:food_app/wifi.dart';
import 'package:food_app/wifi_connect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signUpRoute: (context) => SignupPage(),
        MyRoutes.personalRoute: (context) => Personal(),
        MyRoutes.interestRoute: (context) => Interest(),
        MyRoutes.wifiRoute: (context) => Wifi(),
        MyRoutes.wifideviceRoute: (context) => WifiConnect(),
        MyRoutes.interestRoute: (context) => Interest(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.categoriesRoute: (context) => Categories(),
        MyRoutes.recipeRoute: (context) => Recipe(),
        MyRoutes.recipeDetailsRoute: (context) => RecipeDetails(),
      },
    );
  }
}
