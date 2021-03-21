import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API/API.dart';
import 'BottomNavigation/BottomNav.dart';
import 'Registration/Login.dart';
import 'Splash/Splash.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initi()async{
    await SharedPreferences.getInstance().then((value) {
      Timer(
        Duration(seconds: 5),
            (){
              MyApp.sharedPreferences = value;
          if(MyApp.sharedPreferences.containsKey("access_token")){
            if(MyApp.sharedPreferences.getString("access_token").isNotEmpty){
              API.Category();
              //API.getProduct();
              API.getPopularProduct();
              API.UserProduct();
              API.getBrands();
              API.getRecivedOrder();
              Future.delayed(Duration(seconds: 5), (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => BottomNav()));
              });

            }
            else{
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => IntroScreen()));
            }

          }
          else{
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => IntroScreen()));
          }
        },
      );

      return null;
    });
  }


  @override
  void initState() {
    initi();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            width: 20,
            height: 20,
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/LogoWhite.png',width: 20,
              height: 20,),
          ),
        ),
      )
    );
  }
}