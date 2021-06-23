import 'package:user_api/Address.dart';
import 'package:user_api/Company.dart';

class User {
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final String phone;
  late final String website;
  late final Address address;
  late final Company company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.address,
      required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['address'] = this.address.toJson();
    data['company'] = this.company.toJson();

    return data;
  }
}
