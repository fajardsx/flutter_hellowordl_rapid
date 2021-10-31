import 'package:flutter/material.dart';
import 'package:flutter_hello_world/widgetcomponent/widget_edittextfield.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "registerscreen";
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState<String>>();
  final _passwordKey = GlobalKey<FormFieldState<String>>();
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Register Form"),
            EditTextField(
                fieldkey: _emailKey,
                hintText: "Input your email",
                icondata: Icons.people,
                onsaved: (input) => _email = input!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  return null;
                }),
            EditTextField(
                fieldkey: _passwordKey,
                hintText: "Input your password",
                icondata: Icons.password,
                obscure: true,
                onsaved: (input) => _password = input!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                }),
            ElevatedButton(
                onPressed: () {
                  print("Register");
                  Register();
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }

  void Register() async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      _formkey.currentState?.save();
      print("$_email / $_password");

      // Credential credential = Credential(username: _email, password: _password);
      // print(credential.toJson());
      // //http post to server
      // //..

      // // save ke preference
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setBool("ISLOGIN",true);
      // pref.setString("USERNAME",_email);
      // setState(() {
      //   visibleInfo = true;
      //   responseMessage = "response dari server !";
      // });
      //  Navigator.of(context).pushReplacementNamed(HomeScreen.id);
    }
  }
}
