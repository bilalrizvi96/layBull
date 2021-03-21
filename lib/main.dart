import 'package:flutter/material.dart';
import 'package:freelance2/BottomNavigation/BottomNav.dart';
import 'package:freelance2/Offers/Offer.dart';
import 'package:freelance2/Registration/Login.dart';
import 'package:freelance2/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static SharedPreferences sharedPreferences;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Metropolis',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }

}


