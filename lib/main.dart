import 'package:flutter/material.dart';
import 'package:flutter_hello_world/screen/details_screen.dart';
import 'package:flutter_hello_world/screen/home_screen.dart';
import 'package:flutter_hello_world/screen/login_screen.dart';
import 'package:flutter_hello_world/screen/register_screen.dart';
import 'package:flutter_hello_world/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dotcom App",
      theme: ThemeData(primaryColor: Color(0xFFF8F403)),
      initialRoute: SplashScren.id,
      routes: {
        SplashScren.id: (context) => SplashScren(),
        HomeScreen.id: (context) => HomeScreen(),
        DetailScreen.id:(context) => DetailScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        RegisterScreen.id:(context) => RegisterScreen(),  
      },
    );
  }
}
