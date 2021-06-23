import 'package:flutter/material.dart';
import 'network.dart';
import 'User.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  late List<User> _users = [];
  late List<User> _usersDisplay = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchUser().then((value) {
      setState(() {
        _isLoading = false;
        _users.addAll(value);
        _usersDisplay = _users;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _usersDisplay.length,
        itemBuilder: (BuildContext context, int index) {
          if (!_isLoading) {
            return _listItem(index);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _usersDisplay[index].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              _usersDisplay[index].address.city,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              _usersDisplay[index].address.geo.lat,
              style: TextStyle(fontSize: 16, color: Colors.amber),
            )
          ],
        ),
      ),
    );
  }
}
