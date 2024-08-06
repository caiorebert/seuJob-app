import 'package:flutter/material.dart';

class FormInfoAcademicas extends StatefulWidget {
  const FormInfoAcademicas({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormInfoAcademicasState();
}

class _FormInfoAcademicasState extends State<FormInfoAcademicas> {

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  'Formação Acadêmica',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Instituição',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Curso',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ano de início',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ano de conclusão',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}