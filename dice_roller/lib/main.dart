import 'package:dice_roller/HomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

//TODO: Update pubspec file for image assets first

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}
