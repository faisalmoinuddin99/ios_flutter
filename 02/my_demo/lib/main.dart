import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.deepOrange, accentColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
          //backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I am first text'),
              Text('I am second text'),
              RaisedButton(
                onPressed: () {},
                child: Text('Sign up'),
                color: Colors.orange,
                splashColor: Colors.blue,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add_a_photo,
            color: Colors.blue,
          ),
          splashColor: Colors.cyan,
        ),
      ),
    );
  }
}
