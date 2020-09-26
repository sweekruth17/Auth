import 'package:auth_1/signin/doc_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class doctor_regState extends State<Doctor_reg> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _confirm;
  String username, id, hosp_name;
  String username_d;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [], title: Text("Register and Verify")),
        body: Form(
            key: _formKey,
            child: Wrap(
              children: [
                Container(
                    child: Column(
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
                        if (input.length < 6)
                          return "Please enter min length of 6 characters";
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                          icon: Icon(MdiIcons.key),
                          labelText: "Password",
                          hintText: "name!*&123"),
                    ),
                    TextFormField(
                      validator: (input1) {
                        if (input1.length <= 6 && input1 == _confirm)
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
                        if (input.isEmpty) return "Please enter a valid MIC id";
                      },
                      onSaved: (input) => id = input,
                      decoration: InputDecoration(
                          icon: Icon(
                            MdiIcons.idCard,
                            size: 25.0,
                          ),
                          labelText: " MIC Id",
                          hintText: "45678"),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          splashColor: Colors.white,
                          onPressed: () {
                            signup();
                          },
                          child: Text(
                            "Sign-Up",
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Colors.tealAccent,
                        ))
                  ],
                ))
              ],
            )));
  }

  void signup() async {
    //adding validation
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .then((results) =>
                // ignore: deprecated_member_use
                Firestore.instance.collection("doctors").add({
                  "Username": username,
                  "E-mail": _email,
                  "Password": _password,
                  "Confirm password": _confirm,
                  "MCI id": id,
                }))
            .then((value) => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Select())));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
