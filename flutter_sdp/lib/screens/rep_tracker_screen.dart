import 'package:flutter/material.dart';

class RepTrackerScreen extends StatelessWidget {
  final int totalReps;
  final int goodReps;
  final int badReps;

  const RepTrackerScreen({super.key, 
    this.totalReps = 0,
    this.goodReps = 0,
    this.badReps = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rep Tracker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Total Reps: $totalReps"),
          Text("Good Reps: $goodReps"),
          Text("Bad Reps: $badReps"),
        ],
      ),
    );
  }
}
