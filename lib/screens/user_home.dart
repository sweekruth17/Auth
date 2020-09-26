import 'package:flutter/material.dart';

import 'package:auth_1/register/sign_up_user.dart';

class Home extends StatefulWidget {
  String username = "ok";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(actions: [], title: Text("Hello")));
  }
}
