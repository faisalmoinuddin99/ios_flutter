import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  late AssetImage diceImage;
  late AssetImage newDiceImage;

  @override
  void initState() {
    super.initState();
    setState(() {
      diceImage = one;
      newDiceImage = one;
    });
  }

  void rollDice() {
    int random = (1 + Random().nextInt(6));
    int newRandom = (1 + Random().nextInt(6));

    AssetImage? assignmentImage;

    AssetImage? newIamge;

    switch (random) {
      case 1:
        newIamge = one;

        break;
      case 2:
        newIamge = two;

        break;
      case 3:
        newIamge = three;

        break;
      case 4:
        newIamge = four;

        break;
      case 5:
        newIamge = five;

        break;
      case 6:
        newIamge = six;

        break;
    }

    switch (newRandom) {
      case 1:
        assignmentImage = one;

        break;
      case 2:
        assignmentImage = two;

        break;
      case 3:
        assignmentImage = three;

        break;
      case 4:
        assignmentImage = four;

        break;
      case 5:
        assignmentImage = five;

        break;
      case 6:
        assignmentImage = six;

        break;
    }
    setState(() {
      diceImage = newIamge!;
      newDiceImage = assignmentImage!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: diceImage,
                width: 200.0,
                height: 200.0,
              ),
              Image(
                image: newDiceImage,
                width: 200.0,
                height: 200.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  color: Colors.amber,
                  padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Text(
                    'Roll the dice!',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: rollDice,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
