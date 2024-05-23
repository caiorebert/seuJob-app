import 'package:seujobapp/pages/home/components/vaga_item.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../providers/auth_provider.dart';
import '../../utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list_sharp, size: 30,),
        title: Image.asset("assets/images/logo.png", width: 50,),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Vagas postadas: ", style: TextStyle(fontSize: 20),),
              padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
            ),
            Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          Navigator.pushNamed(context, "/vaga", arguments: {
                            "vagaId": index
                          })
                        },
                        child: VagaItem(),
                      );
                    }
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
