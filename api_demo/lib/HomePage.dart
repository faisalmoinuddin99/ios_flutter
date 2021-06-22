import 'package:api_demo/network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Post.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  final String title;
  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  late List<Post> _posts = [];
  late List<Post> _postsDisplay = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchPost().then((value) {
      setState(() {
        _isLoading = false;
        _posts.addAll(value);
        _postsDisplay = _posts;
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
          itemCount: _postsDisplay.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (!_isLoading) {
              // return _listItem(index);
              return index == 0 ? _searchBar() : _listItem(index - 1);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: 'Searching...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _postsDisplay = _posts.where((post) {
              var postTitle = post.title.toLowerCase();
              return postTitle.contains(text);
            }).toList();
          });
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
              _postsDisplay[index].title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              _postsDisplay[index].body,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
