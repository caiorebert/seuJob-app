import 'package:seujobapp/model/vaga_lista.dart';
import 'package:seujobapp/pages/home/components/vaga_item.dart';
import 'package:seujobapp/providers/auth_provider.dart';
import 'package:seujobapp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../model/vaga.dart';
import '../../providers/auth_provider.dart';
import '../../utils/app_routes.dart';
import 'components/inscricoes.dart';
import 'components/vagas.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var _items = [Vagas(), Inscricoes()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list_sharp,
          size: 30,
        ),
        title: Image.asset(
          "assets/images/logo.png",
          width: 50,
        ),
      ),
      body: _items[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Minhas Vagas"),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}
