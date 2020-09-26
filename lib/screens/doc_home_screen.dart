import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Doctor_home extends StatefulWidget {
  @override
  _Doctor_homeState createState() => _Doctor_homeState();
}

class _Doctor_homeState extends State<Doctor_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Doctor"),
      ),
    );
  }
}
