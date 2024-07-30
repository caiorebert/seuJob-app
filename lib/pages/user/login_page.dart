import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/services/fingerprint_service.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';
import '../../model/worker.dart';
import '../../providers/auth_provider.dart';
import '../../utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool manterConectado = false;
  bool loading = true;
  bool logando = false;

  exibeModalBiometria(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Autenticação biométrica"),
          content: const Text("Deseja ativar a autenticação biométrica?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                //requestBiometric(context);
              },
              child: const Text("Ativar"),
            )
          ],
        );
      }
    );
  }

  requestBiometric(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    FingerPrintService fingerPrintService = FingerPrintService();
    if (await fingerPrintService.checkBioMetricSensor()) {
      if (await fingerPrintService.authenticate()) {
        prefs.setBool("biometric", true);
        Navigator.pushNamed(context, AppRoutes.HOME);
      } else {
        Fluttertoast.showToast(msg: "Autenticação biométrica falhou!");
      }
    } else {
      Fluttertoast.showToast(msg: "Seu dispositivo não suporta autenticação biométrica!");
    }
  }

  verifySharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("login") && prefs.containsKey("senha")) {
      setState(() {
        logando = true;
      });
      _loginController.text = prefs.getString("login").toString();
      _senhaController.text = prefs.getString("senha").toString();
      if (prefs.containsKey("biometric")) {
        bool biometric = prefs.getBool("biometric")!;
        if (biometric) {
          requestBiometric(context);
        }
      }
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    if (!logando) {
      verifySharedPreference();
    }
    return Scaffold(
      body: (loading) ? CircularProgressIndicator() : Column(
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
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Manter-se conectado?"),
                    )
                ),
                Checkbox(value: manterConectado, onChanged: (value) {
                  setState(() {
                    manterConectado = value!;
                  });
                })
              ],
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
                    try {
                      if (await auth.login(login, senha)) {
                        Worker worker = Worker(id: '', userId: '');
                        await worker.getWorkerbyId(auth.user.id, auth.token.toString());
                        auth.user.worker = worker;
                        if (auth.user.worker != null) {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          if (manterConectado) {
                            prefs.setString("login", login);
                            prefs.setString("senha", senha);
                            exibeModalBiometria(context);
                          } else {
                            if (prefs.containsKey("login")) { prefs.remove("login"); }
                            if (prefs.containsKey("senha")) { prefs.remove("senha"); }
                            if (prefs.containsKey("biometric")) { prefs.remove("biometric"); }
                            Navigator.pushNamed(context, AppRoutes.HOME);
                          }
                        } else {
                          Fluttertoast.showToast(msg: "Erro ao carregar dados do usuário!");
                        }
                      } else {
                        Fluttertoast.showToast(msg: "Email ou senha incorretos!");
                      }
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
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
