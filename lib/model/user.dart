
import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String id;
  String login;
  String name;
  bool logged;

  User({ required this.id, required this.login, required this.name, this.logged = false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      login: json['login'],
    );
  }
}