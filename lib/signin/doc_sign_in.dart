import 'package:auth_1/register/doc_sign_up.dart';
import 'package:auth_1/screens/doc_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart'; // used to sign in(auth)

class Login_dState extends State<Login_d> {
  bool _initialized = false;
  bool _error = false;
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

  String _email, _password;
  IconData key;

  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton.icon(
      color: Colors.tealAccent,
      onPressed: () {
        // Navitage bar on top
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Doctor_reg()),
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
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Doctor Protal",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return "Please enter an E-mail";
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                      icon: Icon(
                        CupertinoIcons.mail_solid,
                        size: 25.0,
                      ),
                      labelText: "E-mail",
                      hintText: "abc@gamail.com"),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length >= 6)
                      return "Please enter min length of 6 characters";
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                      icon: Icon(MdiIcons.key),
                      labelText: "Password",
                      hintText: "name!*&123"),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      splashColor: Colors.white,
                      onPressed: () {
                        Doc_sign_in();
                      },
                      child: Text(
                        "Sign-In",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.tealAccent,
                    ))
              ]),
        ));
  }

  void Doc_sign_in() {
    //this is for actual sign up button
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Doctor_home()));
  }
}

class Doctor_reg extends StatefulWidget {
  doctor_regState createState() => new doctor_regState();

  @override
  Widget build(BuildContext context) {}
}
