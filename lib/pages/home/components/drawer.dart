import 'package:flutter/material.dart';

import '../../../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile_picture.png'), // Substitua pelo caminho da sua imagem de perfil
                ),
                SizedBox(height: 10),
                Text(
                  'Nome do Usuário', // Substitua pelo nome do usuário
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Meu Perfil'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.PERFIL); // Rota para a página de perfil
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Estatísticas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.ANALITICS);
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_graph),
            title: Text('Vagas Recomendadas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.RECOMENDACAO);
            },
          ),
          ListTile(
            leading: Icon(Icons.factory),
            title: Text('Empresas Cadastradas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.EMPRESASCADASTRADAS);
            },
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Dicas e Recomendações'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.RECOMENDACOES);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Options'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.SETTINGS);
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.ABOUT);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Deseja realmente sair?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('Não'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              Navigator.pushReplacementNamed(context, '/login'); // Rota para a página de login
                            },
                            child: Text('Sim'),
                          ),
                        ]
                    );
                  }
              );
            },
          ),
        ],
      ),
    );
  }
}
