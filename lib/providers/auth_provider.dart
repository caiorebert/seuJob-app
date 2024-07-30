import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:seujobapp/model/worker.dart';

import '../model/user.dart';
import 'package:http/http.dart' as http;

import '../utils/api_routes.dart';

class AuthProvider with ChangeNotifier {
  bool logando = false;
  String? token = "";

  late User _user;

  User get user => _user;


  Future<bool> login(String login, String senha) async{
    logando = true;
    notifyListeners();

    http.Response responseToken;

    try {
      responseToken = await http.post(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.LOGIN),
          body: jsonEncode({
            "login": login,
            "password": senha
          }),
          headers: {
            'Content-Type': "application/json"
          }
      ).timeout(const Duration(seconds: 5));
    } catch (e) {
      logando = false;
      notifyListeners();
      throw "Erro ao tentar se conectar com o servidor";
    }

    if (responseToken.body.isNotEmpty) {
      final token = jsonDecode(responseToken.body)["token"];
      this.token = token;
      var response = await http.post(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.USER),
          body: jsonEncode({
            "login": login,
            "password": senha
          }),
        headers: {
          'Content-Type': "application/json",
          'Authorization': "Bearer $token",
        }
      );
      logando = false;

      try {
        User user = User.fromJson(jsonDecode(response.body));
        Worker worker = Worker(id: '', userId: user.id);
        worker.getWorkerbyId(user.id, token);
        user.worker = worker;
        _user = user;
        _user.logged = true;
        notifyListeners();
        return true;
      } catch (e) {
        print("error");
      }
    }
    logando = false;
    notifyListeners();
    return false;
  }


  void logout() {
    _user.logged = false;
    notifyListeners();
  }

}
