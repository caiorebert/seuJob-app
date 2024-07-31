import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/utils/app_routes.dart';

import '../../providers/theme_provider.dart';

class DicasPage extends StatefulWidget {
  @override
  _DicasPageState createState() => _DicasPageState();
}

class _DicasPageState extends State<DicasPage> {
  // ... (seu código para o modo escuro)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dicas para Currículo'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.HOME);
            },
          ),
        ),
        body: ListView(
          children: [
            ExpansionTile(
              title: Text('Estrutura do Currículo'),
              children: [
                // Conteúdo da seção "Estrutura do Currículo"
                ListTile(title: Text('Informações Pessoais: Nome, contatos')),
                ListTile(title: Text('Resumo: Breve descrição do seu perfil')),
                ListTile(title: Text('Experiência Profissional: Projetos Flutter')),
                // ... (outros itens da lista)
              ],
            ),

            ExpansionTile(
              title: Text('Conteúdo do Currículo'),
              children: [
                // Conteúdo da seção "Conteúdo do Currículo"
                ListTile(title: Text('Seja específico: Use verbos de ação')),
                ListTile(title: Text('Use palavras-chave: Flutter, widgets, etc.')),
                // ... (outros itens da lista)
              ],
            ),

            // Adicione os outros ExpansionTiles para "Formatação" e "Dicas Extras"
            // da mesma forma que acima
          ],
        ),
      ),
    );
  }
}
