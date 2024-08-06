import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/model/vaga_lista.dart';
import 'package:seujobapp/model/worker_lista.dart';
import 'package:seujobapp/pages/curriculo/components/google_maps_page.dart';
import 'package:seujobapp/pages/curriculo/curriculo_page.dart';
import 'package:seujobapp/pages/empresas/sobre_empresas.dart';
import 'package:seujobapp/pages/home/home_page.dart';
import 'package:seujobapp/pages/recomendacoes/dicas_page.dart';
import 'package:seujobapp/pages/recomendadas/vagas_recomendadas.dart';
import 'package:seujobapp/pages/settings/settings_page.dart';
import 'package:seujobapp/pages/user/cadastro_page.dart';
import 'package:seujobapp/pages/user/login_page.dart';
import 'package:seujobapp/pages/vaga/vaga_page.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/providers/theme_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:seujobapp/pages/analitics/analitics_page.dart';
import 'package:seujobapp/pages/sobre/about_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inicializa o Firebase Analytics
  final analytics = FirebaseAnalytics.instance;

  // Obter o token FCM e configurar permissões (se necessário)
  final messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print('FCM registration token: $token');

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Permissão de notificação concedida.');
  } else {
    print('Permissão de notificação negada ou limitada.');
  }

  // Configuração do FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Lida com mensagens em primeiro plano
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');

      // Exibir notificação local
      const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

      await flutterLocalNotificationsPlugin.show(
        message.notification.hashCode,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
      );

      // Registra evento no Firebase Analytics
      analytics.logEvent(
        name: 'notificacao_recebida',
        parameters: {
          'titulo': message.notification?.title ?? '',
          'corpo': message.notification?.body ?? '',
        },
      );
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => VagaLista()),
        ChangeNotifierProvider(create: (context) => WorkerLista()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DicasPage(),
      routes: {
        AppRoutes.LOGIN: (context) => LoginPage(),
        AppRoutes.PERFIL: (context) => CurriculoPage(),
        AppRoutes.CADASTRO: (context) => CadastroPage(),
        AppRoutes.HOME: (context) => HomePage(),
        AppRoutes.VAGA: (context) => VagaPage(),
        '/google_maps': (context) => GoogleMapsPage(),
        AppRoutes.SETTINGS: (context) => SettingsPage(),
        AppRoutes.ANALITICS: (context) => AnaliticsPage(),
        AppRoutes.ABOUT: (context) => AboutPage(),
        AppRoutes.EMPRESASCADASTRADAS: (context) => EmpresasPage(),
        AppRoutes.RECOMENDACAO: (context) => RecomendadasPage(),
        AppRoutes.RECOMENDACOES: (context) => DicasPage(),
      },
    );
  }
}
