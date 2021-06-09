import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

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
  List<String> nativeNumber = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];
  String defaultText = "Spanish Numbers";

  void displaySNumbers() {
    setState(() {
      defaultText = spanishNumber[counter] + " " + nativeNumber[counter];

      if (counter < 9) {
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
                // RaisedButton(
                //   child: Text(
                //     'Call number',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onPressed: displaySNumbers,
                //   color: Colors.orange,
                // )
              ]),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: displaySNumbers,
        child: Icon(Icons.add_box),
      ),
    );
  }
}
