import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:testingmyownapi/user.dart';

List<User> parseUser(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;
  var users = list.map((model) => User.fromJson(model)).toList();
  return users;
}

Future<List<User>> fetchUser() async {
  final String url = "https://desolate-coast-33062.herokuapp.com/all";
  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return compute(parseUser, response.body);
  } else {
    throw Exception("Request API error");
  }
}
