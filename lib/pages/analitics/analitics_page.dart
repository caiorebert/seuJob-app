import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import '../../providers/theme_provider.dart';

class AnaliticsPage extends StatefulWidget {
  const AnaliticsPage({super.key});

  @override
  _AnaliticsPageState createState() => _AnaliticsPageState();
}

class _AnaliticsPageState extends State<AnaliticsPage> {

  @override
  Widget build(BuildContext context) {
    // Exemplo básico de retorno de um widget Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Analitics Page'),
      ),
      body: Center(
        child: Text('Conteúdo da página de análises'),
      ),
    );
  }
}
