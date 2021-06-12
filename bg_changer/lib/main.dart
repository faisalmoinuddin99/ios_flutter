import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Background'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.yellowAccent,
    Colors.cyan,
    Colors.pink,
    Colors.red,
    Colors.orange
  ];
  var currentColor = Colors.white;
  var buttonColor;
  setRandomColor() {
    var rnd = Random().nextInt(colors.length);
    var bRND = Random().nextInt(colors.length);
    print(rnd);
    setState(() {
      currentColor = colors[rnd];
      buttonColor = colors[bRND];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: currentColor,
        child: Center(
            child: RaisedButton(
          color: buttonColor,
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Text(
            'Change it!',
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
          onPressed: setRandomColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        )));
  }
}
