import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LiveChart extends StatelessWidget {
  final List<FlSpot> dataPoints;

  const LiveChart({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: dataPoints,
            isCurved: true,
          )
        ],
      ),
    );
  }
}
