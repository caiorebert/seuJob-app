import 'package:flutter/material.dart';
import 'package:seujobapp/model/vaga.dart';

class VagaPage extends StatelessWidget {
  const VagaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vaga = ModalRoute.of(context)!.settings.arguments as Vaga;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Vaga'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.blueGrey,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/4844/4844589.png",
                      width: 100,
                      height: 100,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 20,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vaga.titulo,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(height: 5),
                          Text(
                            vaga.local,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Descrição da Vaga:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    vaga.descricao,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.blue,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Tipo de Contrato:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        vaga.formato,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Salário:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        vaga.salary,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Lógica para se inscrever na vaga
        },
        label: Text('Inscrever-se'),
        icon: Icon(Icons.how_to_reg),
      ),
    );
  }
}
