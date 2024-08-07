import 'package:flutter/material.dart';

class FormInfoProfissionais extends StatefulWidget {
  const FormInfoProfissionais({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormInfoProfissionaisState();
}

class _FormInfoProfissionaisState extends State<FormInfoProfissionais> {

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          child: ListView(
            children: [
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
            ],
          ),
    );
  }
}