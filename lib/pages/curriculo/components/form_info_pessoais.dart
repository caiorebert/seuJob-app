import 'package:flutter/material.dart';

class FormInfoPessoais extends StatefulWidget {
  const FormInfoPessoais({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormInfoPessoaisState();
}

class _FormInfoPessoaisState extends State<FormInfoPessoais> {

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                child: const Text("Sobre você:", style: TextStyle(fontSize: 20),),
              ),
              Divider(),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "Nome"),
                          ),
                        )),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Sobrenome"),
                            ))),
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "E-mail"),
                    ),
                  )
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Idade"),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Genêro"),
                            )
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Estado Civil"),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Etnia"),
                            )
                        )
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                child: const Text("Localização:", style: TextStyle(fontSize: 20),),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.red,
              )
            ],
          ),
    );
  }
}