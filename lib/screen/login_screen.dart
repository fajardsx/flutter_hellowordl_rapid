import 'package:flutter/material.dart';
import 'package:flutter_hello_world/models/creidensial.dart';
import 'package:flutter_hello_world/screen/home_screen.dart';
import 'package:flutter_hello_world/screen/register_screen.dart';
import 'package:flutter_hello_world/widgetcomponent/widget_edittextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "loginscreen";
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //untuk save state dari form
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailfieldkey = GlobalKey<FormFieldState>();
  final _passwordfieldkey = GlobalKey<FormFieldState>();
  // init value
  String _email = '', _password = '';
  bool visibleInfo = false;
  String responseMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/dummyimage.jpg"),
                    width: 150,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Login Form"),
                  EditTextField(
                    fieldkey: _emailfieldkey,
                    hintText: "Input your email",
                    onsaved: (input) => _email = input!,
                    icondata: Icons.email,
                  ),
                  EditTextField(
                    fieldkey: _passwordfieldkey,
                    hintText: "Input Your Password",
                    onsaved: (input) => _password = input!,
                    icondata: Icons.password,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signIn();
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: () {
                      print("signup");
                      Navigator.of(context).pushNamed(RegisterScreen.id);
                    },
                    child: Text('Sign Up'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  if (visibleInfo)
                    Container(
                      child:
                          Text(responseMessage, style: TextStyle(color: Colors.red)),
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  void signIn() async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      _formkey.currentState?.save();
      print("$_email / $_password");

      Credential credential = Credential(username: _email, password: _password);
      print(credential.toJson());
      //http post to server
      //..

      // save ke preference
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("ISLOGIN",true);
      pref.setString("USERNAME",_email);
      setState(() {
        visibleInfo = true;
        responseMessage = "response dari server !";
      });
       Navigator.of(context).pushReplacementNamed(HomeScreen.id);
    }
  }
}
