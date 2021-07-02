class User {
  late final String name;
  late final String email;

  User({required this.name, required this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;

    data['email'] = this.email;

    return data;
  }
}
