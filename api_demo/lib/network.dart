import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Post.dart';

List<Post> parsePost(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;
  var posts = list.map((model) => Post.fromJson(model)).toList();
  return posts;
}

Future<List<Post>> fetchPost() async {
  final String url = "http://jsonplaceholder.typicode.com/posts";
  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return compute(parsePost, response.body);
  } else {
    throw Exception("Request API Error");
  }
}
