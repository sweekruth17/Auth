import 'package:auth_1/signin/doc_sign_in.dart';
import 'package:auth_1/signin/signin.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(Start());

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Start",
        home: Select());
  }
}

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class Login_d extends StatefulWidget {
  @override
  Login_dState createState() => new Login_dState();
}

class Select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text(
          "Getting Started",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Text(
              "User...?",
              style: TextStyle(fontSize: 35.0),
            ),
            Text(
              "  Log-in/Register from here! ",
              style: TextStyle(fontSize: 29.0),
            ),
            RaisedButton.icon(
                color: Colors.tealAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                icon: Icon(MdiIcons.arrowRightBold, color: Colors.black),
                label: Text("Continue", style: TextStyle(color: Colors.black))),
            Container(
              height: 50.0,
            ),
            Text(
              "Doctor...?",
              style: TextStyle(fontSize: 35.0),
            ),
            Text(
              "  Log-in/Register from here! ",
              style: TextStyle(fontSize: 29.0),
            ),
            RaisedButton.icon(
                color: Colors.tealAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login_d()),
                  );
                },
                icon: Icon(MdiIcons.arrowRightBold, color: Colors.black),
                label: Text("Continue", style: TextStyle(color: Colors.black))),
          ])),
    );
  }
}
