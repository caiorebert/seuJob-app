import 'dart:convert';

import 'package:seujobapp/model/vaga.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/utils/api_routes.dart';
import '../../model/vaga_lista.dart';
import '../../utils/app_routes.dart';
import 'package:http/http.dart' as http;


class VagaPage extends StatelessWidget {
  const VagaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final vagasList = Provider.of<VagaLista>(context);
    final vaga = ModalRoute.of(context)!.settings.arguments as Vaga;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.blueGrey,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Image.network("https://cdn-icons-png.flaticon.com/512/4844/4844589.png"),
                    width: 100,
                    margin: EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 20
                    ),
                    height: double.infinity,
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(30)),
                            Text(vaga.titulo, style: TextStyle(fontSize: 20, color: Colors.white),),
                            Text(vaga.local, style: TextStyle(fontSize: 15, color: Colors.white)),
                          ],
                        )
                      ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20
                ),
              child: Text("Descrição da vaga:", style: TextStyle(fontSize: 20),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20
              ),
              child: Text(vaga.descricao),
            ),
            Container(

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final url = Uri.parse('${ApiRoutes.BASE_URL + ApiRoutes.INSCRICAO}');
          final response = await http.post(url, body: json.encode({
            'jobId': vaga.id,
            'workedId': 1,
          }));

          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Inscrito com sucesso!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Falha ao se inscrever.')),
            );
          }
        },
        child: Icon(Icons.post_add),
      )
    );
  }
}
