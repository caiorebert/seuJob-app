import 'package:flutter/cupertino.dart';
import 'package:seujobapp/model/vaga.dart';
import 'package:http/http.dart' as http;

class VagaLista with ChangeNotifier {
  late List<Vaga> vagas;

  void getVagas() async {
      final response = await http.get();
  }
}