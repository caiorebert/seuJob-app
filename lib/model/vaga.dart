import 'package:flutter/widgets.dart';

class Vaga with ChangeNotifier {
  int id;
  String titulo;
  String salary;
  String descricao;
  String local;
  String formato;
  String data_publicacao;
  String empresa;

  Vaga({required this.id, required this.titulo, required this.salary, required this.descricao, required this.local,
      required this.formato, required this.data_publicacao, required this.empresa});

  factory Vaga.fromJson(Map<String, dynamic> json) {
    return Vaga(
      id: int.parse(json["id"].toString()),
      titulo: json["title"],
      salary: json["salary"],
      data_publicacao: json["publish_date"],
      formato: json["contract_type"],
      empresa: json["companyId"].toString(),
      local: json["location"],
      descricao: json["description"]
    );
  }
}