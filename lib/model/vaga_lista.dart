import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:seujobapp/model/vaga.dart';
import 'package:http/http.dart' as http;

import '../utils/api_routes.dart';
import '../utils/app_routes.dart';

class VagaLista with ChangeNotifier {
  late List<Vaga> _vagas = [];

  List<Vaga> get vagas {
    return [..._vagas];
  }

  void getVagas(String token) async {
      final response = await http.get(Uri.parse(ApiRoutes.BASE_URL + ApiRoutes.VAGAS),
          headers: {
            'Authorization': "Bearer $token",
          });
      if (response.body.isNotEmpty) {

        List<dynamic> jsonList = jsonDecode(response.body);

        _vagas = jsonList.map((json) => Vaga.fromJson(json)).toList();

        notifyListeners();
      }
  }
}