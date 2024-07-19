import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/model/vaga_lista.dart';
import 'package:seujobapp/model/worker_lista.dart';
import 'package:seujobapp/pages/home/home_page.dart';
import 'package:seujobapp/pages/home/settings/settings_page.dart';
import 'package:seujobapp/pages/user/cadastro_page.dart';
import 'package:seujobapp/pages/user/login_page.dart';
import 'package:seujobapp/pages/vaga/vaga_page.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/providers/theme_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider()
        ),
        ChangeNotifierProvider(
            create: (context) => VagaLista()
        ),
        ChangeNotifierProvider(
            create: (context) => WorkerLista()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
        routes: {
          AppRoutes.LOGIN : (context) => LoginPage(),
          AppRoutes.CADASTRO : (context) => CadastroPage(),
          AppRoutes.HOME : (context) => HomePage(),
          AppRoutes.VAGA : (context) => VagaPage(),
          AppRoutes.SETTINGS : (context) => SettingsPage(),
        },
      ),
    );
  }
}