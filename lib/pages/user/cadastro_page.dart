import 'package:seujobapp/model/user.dart';
import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({
    Key? key,
  }) : super(key: key);
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _sobrenomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD9D9D9),
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.LOGIN);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            height: 100,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "CADASTRO",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(hintText: "Nome"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextFormField(
                    controller: _sobrenomeController,
                    decoration: InputDecoration(hintText: "Sobrenome"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "E-mail"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _telefoneController,
              decoration: InputDecoration(hintText: "Telefone"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextFormField(
                    controller: _loginController,
                    decoration: InputDecoration(hintText: "Login"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextFormField(
                    controller: _senhaController,
                    decoration: InputDecoration(hintText: "Senha"),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: () {
                  var nome = _nomeController.text;
                  var sobrenome = _sobrenomeController.text;
                  var email = _emailController.text;
                  var telefone = _telefoneController.text;
                  var login = _loginController.text;
                  var senha = _senhaController.text;

                  final snackbar = SnackBar(
                    content: const Text("Usuário adicionado"),
                    action: SnackBarAction(
                      label: 'Ir pro login',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.LOGIN);
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);

                  _nomeController.text = "";
                  _sobrenomeController.text = "";
                  _emailController.text = "";
                  _telefoneController.text = "";
                  _loginController.text = "";
                  _senhaController.text = "";
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Cor de fundo do botão
                ),
                child: Text(
                  "REALIZAR CADASTRO",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
