
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:seujobapp/model/worker.dart';

import '../utils/api_routes.dart';

class User with ChangeNotifier {
  String id;
  String login;
  String name;
  String password;
  String email;
  String phoneNumber;
  bool logged;
  Worker? worker;

  User({
    required this.id,
    required this.login,
    required this.name,
    this.logged = false,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.worker
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      login: json['login'],
      email: json['email'],
      phoneNumber: json['phone'],
      password: json['password']
    );
  }

  Future<String?> save() async {
    final response = await http.post(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.SAVE_USER),
        body: jsonEncode({
          "name": name,
          "email": email,
          "login": login,
          "phone": phoneNumber,
          "password": password
        }),
        headers: {
          'Content-Type': "application/json"
        }
    );
    if (response.body.isNotEmpty) {
      User user = User.fromJson(jsonDecode(response.body));
      return user.id;
    } else {
      return null;
    }
  }
}