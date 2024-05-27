import 'package:fluttertoast/fluttertoast.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../model/worker.dart';
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 40
            ),
            alignment: Alignment.center,
            width: double.infinity,
            child: Image.asset("assets/images/logo_extended.png"),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            child: TextFormField(
              controller: _loginController,
              decoration: const InputDecoration(
                hintText: "Login"
              ),
              validator: (value) {
                if (value==null || value=="") {
                  return "Campo de login é obrigatório!";
                }
                return null;
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            child: TextFormField(
              obscureText: true,
              controller: _senhaController,
              decoration: const InputDecoration(
                  hintText: "Senha"
              ),
              validator: (value) {
                if (value==null || value=="") {
                  return "Campo de senha é obrigatório!";
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith((states) {
                  return Colors.white;
                }),
                textStyle: MaterialStateProperty.resolveWith((states) {
                  return const TextStyle(color: Colors.white);
                }),
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return const Color.fromRGBO(255, 68, 85, 1);
                  })),
              onPressed: () async {
                final login = _loginController.text.trim();
                final senha = _senhaController.text.trim();
                if (login.isNotEmpty && senha.isNotEmpty) {
                  if ( await auth.login(login, senha)) {
                    Worker worker = Worker(id: '', userId: '');
                    await worker.getWorkerbyId(auth.user.id, auth.token.toString());
                    auth.user.worker = worker;
                    if (context.mounted) {
                      Navigator.pushNamed(context, "/home");
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Email ou senha incorretos!");
                  }
                } else {
                  Fluttertoast.showToast(msg: "Por favor preencha os campos!");
                }
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
