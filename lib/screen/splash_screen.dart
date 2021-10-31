import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_hello_world/screen/home_screen.dart';
import 'package:flutter_hello_world/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScren extends StatefulWidget {
  static const String id = "splash_screen";
  SplashScren({Key? key}) : super(key: key);

  @override
  _SplashScrenState createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  late Timer _timer;
  changeScreen() {
    return _timer = Timer(Duration(seconds: 3), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      print(pref.getBool("ISLOGIN"));
      print(pref.getString("USERNAME"));
      if (pref.containsKey("ISLOGIN")) {
        Navigator.of(context).pushNamed(HomeScreen.id);
      } else {
        Navigator.of(context).pushNamed(LoginScreen.id);
      }
    });
  }

  //constructor widget
  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 150,
                image: AssetImage("assets/images/dummyimage.jpg"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Dotcom Solution", style: TextStyle(color: Colors.blue)),
            ],
          ),
        ));
  }
}
