import 'package:auth_1/register/sign_up_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth_1/screens/user_home.dart';

import '../screens/user_home.dart';

class LoginState extends State<Login> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  String message_e = '', message_p = '';
  String _email, _password;
  IconData key;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //key=FlutterIconPicker.showIconPicker(context,iconPackMode: IconPack.material)
  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton.icon(
      color: Colors.tealAccent,
      onPressed: () {
        // Navitage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sign_up_t()),
        );
      },
      label: Text(
        "Sign-Up",
        style: TextStyle(color: Colors.black),
      ),
      icon: Icon(
        CupertinoIcons.profile_circled,
        color: Colors.black,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          // leading: Icon(CupertinoIcons.play_arrow),
          actions: [raisedButton],
          title: Text("Sign_In"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "User Protal",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return "Please enter an E-mail";
                    errorText:
                    message_e;
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    icon: Icon(
                      CupertinoIcons.mail_solid,
                      size: 25.0,
                    ),
                    labelText: "E-mail",
                    hintText: "abc@gamail.com",
                  ),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6)
                      return "Please enter min length of 6 characters";
                    errorText:
                    message_p;
                  },
                  obscureText: true,
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                    icon: Icon(MdiIcons.key),
                    labelText: "Password",
                    hintText: "name!*&123",
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      splashColor: Colors.white,
                      onPressed: signin,
                      child: Text(
                        "Sign-In",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.tealAccent,
                    ))
              ]),
        ));
  }

  Future<void> signin() async {
//connect to firebase
//validation
    final formState = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      //if true log in to firebase
      _formKey.currentState.save();
      try {
        // ignore: deprecated_member_use
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        // String u = _email;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

//this is created for registeration
class Sign_up_t extends StatefulWidget {
  @override
  Sign_up_tState createState() => new Sign_up_tState();
}
