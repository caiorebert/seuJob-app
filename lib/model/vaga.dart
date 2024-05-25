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

  Vaga(this.id, this.titulo, this.salary, this.descricao, this.local,
      this.formato, this.data_publicacao, this.empresa);
}