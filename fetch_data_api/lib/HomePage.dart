import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getUserData() async {
    var response =
        await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["name"], u["email"], u["userName"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Click me'),
          onPressed: () {
            getUserData();
          },
        ),
      ),
    );
  }
}

class User {
  final String name, email, userName;

  User(this.name, this.email, this.userName);
}
