import 'package:flutter/material.dart';
import 'package:flutter_sdp/widgets/ble_service.dart';

class BleScannerScreen extends StatelessWidget {
  const BleScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pair Device"),
      ),
      body: Center(
        child: BlePairingScreen(), 
      ),
    );
  }
}
