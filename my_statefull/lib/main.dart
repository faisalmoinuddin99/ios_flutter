import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> spanishNumber = [
    "uno",
    "dos",
    "trs",
    "cuatro",
    "cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ];
  String defaultText = "Spanish Numbers";

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My statefull App"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  defaultText,
                  style: TextStyle(fontSize: 30.0),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text('Call number'),
                  onPressed: () {},
                  color: Colors.orange,
                )
              ]),
        ),
      ),
    );
  }
}
