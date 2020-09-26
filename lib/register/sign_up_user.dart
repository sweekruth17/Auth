import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth_1/signin/signin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

//feilds to fill up
// name/password/confirm passwod//weight//height//any existing illnesses
class Sign_up_tState extends State<Sign_up_t> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  String _email, _password, _confirm;
  String username, weight, height, blood_t, illness;
  String email, password; //this must be used to display in home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter your Details"),
        ),
        body: Form(
            key: _formKey,
            child: Wrap(children: [
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    //weight
                    validator: (input) {
                      if (input.isEmpty) return "Please enter your Username";
                    },
                    onSaved: (input) => username = input,
                    decoration: InputDecoration(
                        icon: Icon(
                          MdiIcons.textAccount,
                          size: 25.0,
                        ),
                        labelText: "Username",
                        hintText: "Happy"),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) return "Please enter an E-mail";
                    },
                    onSaved: (input) {
                      _email = input;
                      // email = _email;
                    },
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
                      if (input.length < 6)
                        return "Please enter min length of 6 characters";
                    },
                    onSaved: (input) {
                      _password = input;
                      password = _password;
                    },
                    decoration: InputDecoration(
                        icon: Icon(MdiIcons.key),
                        labelText: "Password",
                        hintText: "name!*&123"),
                  ),
                  TextFormField(
                    validator: (input1) {
                      if (input1.length < 6 && input1 == _confirm)
                        return "Please enter min length of 6 characters";
                    },
                    onSaved: (input) => _confirm = input,
                    decoration: InputDecoration(
                        icon: Icon(MdiIcons.key),
                        labelText: "Confirm Password",
                        hintText: "name!*&123"),
                  ),
                  TextFormField(
                    //weight
                    validator: (input) {
                      if (input.isEmpty) return "Please enter your Weight";
                    },
                    onSaved: (input) => weight = input,
                    decoration: InputDecoration(
                        icon: Icon(
                          MdiIcons.weight,
                          size: 25.0,
                        ),
                        labelText: "Weight in Kg",
                        hintText: "47"),
                  ),
                  TextFormField(
                    //weight
                    validator: (input) {
                      if (input.isEmpty) return "Please enter your Height";
                    },
                    onSaved: (input) => height = input,
                    decoration: InputDecoration(
                        icon: Icon(
                          MdiIcons.ruler,
                          size: 25.0,
                        ),
                        labelText: "Height in cm",
                        hintText: "157"),
                  ),
                  TextFormField(
                    //weight
                    validator: (input) {
                      if (input.isEmpty) return "Please enter your Blood type";
                    },
                    onSaved: (input) => blood_t = input,
                    decoration: InputDecoration(
                        icon: Icon(
                          MdiIcons.bloodBag,
                          size: 25.0,
                        ),
                        labelText: "Blood Group",
                        hintText: "B+"),
                  ),
                  TextFormField(
                    //weight
                    validator: (input) {
                      illness = input;
                    },

                    decoration: InputDecoration(
                        //icon: Icon(
                        //  MdiIcons.,
                        //   size: 25.0,
                        //  ),
                        labelText: "         Any existing illnesses",
                        hintText: "       (optional)"),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        splashColor: Colors.white,
                        onPressed: signup,
                        child: Text(
                          "Sign-Up",
                          style: TextStyle(color: Colors.black),
                        ),
                        color: Colors.tealAccent,
                      ))
                ],
              ))
            ])));
  }

  Future<void> signup() async {
//validation for sign up button
// button present in the bottom
    if (_formKey.currentState.validate()) {
      String username = "lul";
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .then((results) =>
                // ignore: deprecated_member_use
                Firestore.instance.collection("users").add({
                  "Username": username,
                  "E-mail": _email,
                  "Password": _password,
                  "Confirm password": _confirm,
                  "Weight": weight,
                  "Height": height,
                  "Blood type": blood_t,
                  "Existing illness": illness
                }))
            .then((value) => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Select())));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
