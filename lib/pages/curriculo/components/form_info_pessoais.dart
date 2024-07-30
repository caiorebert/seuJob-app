import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormInfoPessoais extends StatefulWidget {
  const FormInfoPessoais({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormInfoPessoaisState();
}

class _FormInfoPessoaisState extends State<FormInfoPessoais> {
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _paisController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  bool selecionando = false;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Placemark address = ModalRoute.of(context)!.settings.arguments as Placemark;
      if (!selecionando) {
        _paisController.text = address.country.toString();
        _estadoController.text = address.administrativeArea.toString();
        _cidadeController.text = address.subAdministrativeArea.toString();
        _ruaController.text = address.thoroughfare.toString();
        _numeroController.text = address.subThoroughfare.toString();
        // _complementoController.text = address.subAdministrativeArea.toString();
        _bairroController.text = address.subLocality.toString();
        _cepController.text = address.postalCode.toString();
        Fluttertoast.showToast(msg: "Endereço carregado com sucesso!", toastLength: Toast.LENGTH_SHORT);
      }
    }
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
              const Divider(),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                child: const Text("Localização:", style: TextStyle(fontSize: 20),),
              ),
              const Divider(),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selecionando = true;
                      });
                      Navigator.pushNamed(context, '/google_maps');
                    },
                    child: const Text("Selecionar no mapa"),
                  ),
                )
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "País"),
                    controller: _paisController,
                  )
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Estado"),
                    controller: _estadoController,
                  )
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Cidade"),
                    controller: _cidadeController,
                  )
              ),
              Container(
                padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Rua"),
                    controller: _ruaController,
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
                              decoration: InputDecoration(hintText: "Número"),
                              controller: _numeroController,
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Bairro"),
                              controller: _bairroController,
                            )
                        )
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Complemento"),
                    controller: _complementoController,
                  )
              ),
            ],
          ),
    );
  }
}