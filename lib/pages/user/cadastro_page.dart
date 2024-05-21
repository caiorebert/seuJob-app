import 'package:seujobapp/model/user.dart';
import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

class CadastroPage extends StatelessWidget {
CadastroPage({
    Key? key,
  }) : super(key: key);
  TextEditingController _loginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Text("Cadastro do MP4", style: TextStyle(fontSize: 30),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                  hintText: "Nome"
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                  hintText: "Login"
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var login = _loginController.text;
                var senha = _senhaController.text;
                var nome = _nomeController.text;

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

                _loginController.text = "";
                _nomeController.text = "";
                _senhaController.text = "";
              },
              child: Text("CADASTRAR")
          )
        ],
      ),
    );
  }
}
