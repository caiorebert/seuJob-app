import 'package:seujobapp/model/vaga_lista.dart';
import 'package:seujobapp/pages/home/components/vaga_item.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../model/vaga.dart';
import '../../providers/auth_provider.dart';
import '../../utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    final vagasList = Provider.of<VagaLista>(context);

    vagasList.getVagas(auth.token.toString());

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list_sharp,
          size: 30,
        ),
        title: Image.asset(
          "assets/images/logo.png",
          width: 50,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Vagas postadas: ",
                style: TextStyle(fontSize: 20),
              ),
              padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
            ),
            Expanded(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Consumer<VagaLista>(
                      builder: (ctx, vagasList, child) {
                        return ListView.builder(
                          itemCount: vagasList.vagas.length,
                          itemBuilder: (ctx, index) =>
                              ChangeNotifierProvider.value(
                                  value: vagasList.vagas[index],
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.pushNamed(ctx, "/vaga",
                                          arguments: {"vagaId": index})
                                    },
                                    child: VagaItem(vaga: vagasList.vagas[index]),
                                  )),
                        );
                      },
                    ),
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Vagas"),
        ],
      ),
    );
  }
}
