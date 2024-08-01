import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/utils/app_routes.dart';

import '../../providers/theme_provider.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // ... (seu código para o modo escuro)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sobre'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.HOME);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo do Aplicativo (opcional)
              Image.asset('assets/images/logo.png', height: 100),

              SizedBox(height: 20),

              // Título e Descrição
              Text(
                'SeuJobApp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Seu aplicativo para encontrar as melhores oportunidades de emprego em Flutter. Encontre vagas, candidate-se e acompanhe o processo seletivo de forma simples e rápida.',
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              // Versão e Informações de Contato
              Text('Versão 1.0.0'),
              SizedBox(height: 5),
              Text('Contato: contato@seujobapp.com'), // Substitua pelo seu e-mail de contato
            ],
          ),
        ),
      ),
    );
  }
}
