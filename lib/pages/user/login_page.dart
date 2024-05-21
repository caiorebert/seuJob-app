import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../providers/auth_provider.dart';
import '../../utils/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final TextEditingController _loginController = TextEditingController();
    final TextEditingController _senhaController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 50)),
          Container(
            color: Colors.yellowAccent,
            padding: EdgeInsets.symmetric(
              vertical: 50
            ),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text("MP4", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            child: TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                hintText: "Login"
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            child: TextFormField(
              obscureText: true,
              controller: _senhaController,
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                final login = _loginController.text.trim();
                final senha = _senhaController.text.trim();
                auth.login(login, senha);
              },
              child: Consumer<AuthProvider>(
                builder: (context, auth, child) {
                  return (auth.logando) ? Text("CARREGANDO...") : Text("ENTRAR");
                },
              )
            ),
          ),
          Container(
            child: InkWell(
              child: Text("Cadastre-se aqui"),
              onTap: () => {
                Navigator.pushNamed(context, AppRoutes.CADASTRO)
              },
            ),
          )
        ],
      )
    );
  }
}
