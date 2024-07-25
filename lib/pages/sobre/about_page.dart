import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/utils/app_routes.dart';

import '../../providers/theme_provider.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _darkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Envolve o Scaffold com MaterialApp
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold( // Adicione o Scaffold aqui
        appBar: AppBar(
          title: Text('Configurações'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.HOME);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            SwitchListTile(
              title: Text('Modo Escuro'),
              value: _darkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
