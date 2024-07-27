import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormInfoPessoais extends StatefulWidget {
  const FormInfoPessoais({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormInfoPessoaisState();
}

class _FormInfoPessoaisState extends State<FormInfoPessoais> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
              Divider(),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                child: const Text("Localização:", style: TextStyle(fontSize: 20),),
              ),
              Divider(),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/google_maps');
                    },
                    child: Text("Selecionar no mapa"),
                  ),
                )
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "País"),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Estado"),
                  )
              ),
              Container(
                padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Rua"),
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
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Bairro"),
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
                  )
              ),
            ],
          ),
    );
  }
}