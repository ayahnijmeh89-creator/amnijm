import 'package:flutter/material.dart';
import 'live_trace_screen.dart';
import 'rep_tracker_screen.dart';
import 'form_analysis_screen.dart';


import 'package:flutter_sdp/screens/ble_scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SquatSense")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(
            child: Text("Live Squat Trace"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LiveTraceScreen()),
            ),
          ),
          ElevatedButton(
            child: Text("Rep Tracker"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RepTrackerScreen()),
            ),
          ),
          ElevatedButton(
            child: Text("Form Analysis"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FormAnalysisScreen()),
            ),
          ),
          ElevatedButton(
            child: Text("Pair Your Device"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BleScannerScreen()),
            ),
          ),
        
        ],
      ),
    );
  }
}
