import 'package:seujobapp/model/vaga_lista.dart';
import 'package:seujobapp/pages/home/components/vaga_item.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inscricoes extends StatelessWidget {
  const Inscricoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final inscritasList = Provider.of<VagaLista>(context);

    //inscritasList.getVagasInscritas(auth.user.id, auth.token.toString());

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Vagas inscritas: ",
              style: TextStyle(fontSize: 20),
            ),
            padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
          ),
          Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Consumer<VagaLista>(
                  builder: (ctx, inscritasList, child) {
                    return ListView.builder(
                      itemCount: inscritasList.vagas.length,
                      itemBuilder: (ctx, index) =>
                          ChangeNotifierProvider.value(
                              value: inscritasList.vagas[index],
                              child: InkWell(
                                onTap: () =>
                                {
                                  Navigator.pushNamed(ctx, "/vaga",
                                      arguments: inscritasList.vagas[index])
                                },
                                child: VagaItem(
                                    vaga: inscritasList.vagas[index]),
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