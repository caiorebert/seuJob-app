import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/model/vaga_lista.dart'; // Importe o modelo de vagas
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';

class EmpresasPage extends StatefulWidget {
  @override
  _EmpresasPageState createState() => _EmpresasPageState();
}

class _EmpresasPageState extends State<EmpresasPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final vagasList = Provider.of<VagaLista>(context);
    vagasList.getVagas(auth.token.toString()); // Supondo que você tenha o token de autenticação

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Empresas'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.HOME);
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: Text(
                'Empresas Conveniadas:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Consumer<VagaLista>(
                builder: (ctx, vagasList, child) {
                  return ListView.builder(
                    itemCount: vagasList.vagas.length,
                    itemBuilder: (ctx, index) {
                      final empresa = vagasList.vagas[index].empresa;
                      return ListTile( // Use ListTile para exibir o nome da empresa
                        title: Text(empresa), // Exibe apenas o nome da empresa
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
