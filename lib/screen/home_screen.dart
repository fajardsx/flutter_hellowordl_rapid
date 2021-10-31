import 'package:flutter/material.dart';
import 'package:flutter_hello_world/screen/details_screen.dart';
import 'package:flutter_hello_world/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  HomeScreen({Key? key}) : super(key: key); //constructor

  @override
  _HomeScreenState createState() => _HomeScreenState(); //overiding state
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //location widget
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home screen"),
              ElevatedButton(
                  onPressed: () async {
                    print("on press");
                    var result = await Navigator.pushNamed(
                        context, DetailScreen.id,
                        arguments: {"data1": "abc", "data2": 12345});
                    print("result $result");
                  },
                  child: Text("Pindah ke page Detail  ")),
              ElevatedButton(
                  onPressed: () async {
                    print("on press");
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();

                    pref.remove("ISLOGIN");
                    pref.remove("USERNAME");
                    //
                    pref.clear();
                    Navigator.of(context).pushReplacementNamed(LoginScreen.id);
                  },
                  child: Text("Logout  ")),
            ],
          ),
        ),
      ),
    );
  }
}
