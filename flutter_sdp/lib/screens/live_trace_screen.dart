
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/live_chart.dart';

class LiveTraceScreen extends StatefulWidget {
  const LiveTraceScreen({super.key});

  @override
  _LiveTraceScreenState createState() => _LiveTraceScreenState();
}

class _LiveTraceScreenState extends State<LiveTraceScreen> {
  List<FlSpot> dataPoints = [];
  double time = 0;

  void addPoint(double value) {
    setState(() {
      dataPoints.add(FlSpot(time, value));
      time += 1;

      if (dataPoints.length > 50) {
        dataPoints.removeAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Trace")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: LiveChart(dataPoints: dataPoints),
      ),
    );
  }
}

