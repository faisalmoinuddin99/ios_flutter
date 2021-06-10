import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyApp> {
  List<String> urduAlphabets = [
    "أ",
    "ب",
    "ت",
    "س",
    "ش",
    "ح",
    "ج",
    "خ",
    "ص",
    "ض",
    "ط",
    "ظ",
    "م",
    "ن"
  ];
  int counter = 0;

  String letter = "Arabic Alphabet";
  String printArabicLetter = "";

  void displayArabicAlphabet() {
    setState(() {
      int arrayLength = urduAlphabets.length;
      printArabicLetter = urduAlphabets[counter];

      if (counter < arrayLength - 1) {
        counter += 1;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
          height: 500,
          margin: const EdgeInsets.only(top: 50.0),
          child: Card(
              elevation: 0,
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  side: BorderSide(color: Colors.black45, width: 1.0)),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        letter,
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(
                        printArabicLetter,
                        style: TextStyle(fontSize: 300.0),
                      )
                    ]),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: displayArabicAlphabet,
        child: Icon(Icons.add_alarm_sharp),
      ),
    );
  }
}
