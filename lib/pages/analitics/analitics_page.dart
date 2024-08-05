import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Estatísticas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.HOME);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(y: 5, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(y: 3, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(y: 2, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                ],
              ),
            ],
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Aplicadas';
                    case 1:
                      return 'Em andamento';
                    case 2:
                      return 'Aprovadas';
                    case 3:
                      return 'Rejeitadas';
                    default:
                      return '';
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
