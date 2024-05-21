
import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String id;
  String login;
  String nome;
  bool logged;

  User({ required this.id, required this.login, required this.nome, this.logged = false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      nome: json['nome'],
      login: json['login'],
    );
  }
}