
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VagaItem extends StatelessWidget {
  const VagaItem({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(15), child: Image.network("https://cdn-icons-png.flaticon.com/512/4844/4844589.png", width: 80,)),
                Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("VAGA TAL E TAL E TAL", style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    )
                )
              ],
            ),
            Divider(),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Text("Salário: "),
                                )
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Text("Formato: "),
                                )
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Text("Carga horária:"),
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
              )
            )],
        ),
      ),
    );
  }
}