import 'package:seujobapp/model/vaga_lista.dart';
import 'package:seujobapp/pages/home/components/vaga_item.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Vagas extends StatelessWidget {
  const Vagas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final vagasList = Provider.of<VagaLista>(context);
    vagasList.getVagas(auth.token.toString());

    return Container(
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
                                      arguments: vagasList.vagas[index])
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
    );
  }
}