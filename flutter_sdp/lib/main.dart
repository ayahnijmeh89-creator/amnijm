
import 'package:flutter/material.dart';
import 'package:flutter_sdp/screens/home_screen.dart';

void main() {
  runApp(SquatApp());
}

class SquatApp extends StatelessWidget {
  const SquatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SquatSense',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}