import 'package:flutter/material.dart';

class FormAnalysisScreen extends StatelessWidget {
  final double accuracy;

  const FormAnalysisScreen({super.key, this.accuracy = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Analysis")),
      body: Center(
        child: Text(
          "Accuracy: ${accuracy.toStringAsFixed(1)}%",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

