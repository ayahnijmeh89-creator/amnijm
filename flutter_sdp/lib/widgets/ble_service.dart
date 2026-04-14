import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BlePairingScreen extends StatefulWidget {
  const BlePairingScreen({super.key});

  @override
  _BlePairingScreenState createState() => _BlePairingScreenState();
}

class _BlePairingScreenState extends State<BlePairingScreen> {
  final FlutterBluePlus flutterBlue = FlutterBluePlus();
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? targetCharacteristic;
  String console = '';

  @override
  void initState() {
    super.initState();
    ensureBluetoothOn();
    startScan();
  }

  Future<void> ensureBluetoothOn() async {
    FlutterBluePlus.adapterState.listen((state)async{
      if(state == BluetoothAdapterState.off){
        setState((){

        });
        
      }
    });
  }

  void startScan() {
    devicesList.clear();
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        if (result.device.name.isNotEmpty &&
          !devicesList.contains(result.device)) {
          setState(() {
            devicesList.add(result.device);
          });
        }
      }
    });

    FlutterBluePlus.isScanning.listen((isScanning) {
      if (!isScanning) {
        setState(() {}); // refresh when scanning stops
      }
    });
  }

  Future<void> connectDevice(BluetoothDevice device) async {
    setState(() {
      console = 'Connecting to ${device.name}...';
    });

    try {
      await device.connect(
        license:License.free,
        timeout: const Duration(seconds: 15));
    } catch (e) {
      // ignore if already connected
    }

    setState(() {
      connectedDevice = device;
      console = 'Connected to ${device.name}';
    });

    final services = await device.discoverServices();
    for (var service in services) {
      for (var char in service.characteristics) {
        // Replace this UUID with your device characteristic UUID
        if (char.uuid.toString() ==
            'abcd1234-5678-1234-5678-abcdef123456') {
          targetCharacteristic = char;
          await char.setNotifyValue(true);
          char.value.listen((value) {
            final text = String.fromCharCodes(value);
            setState(() {
              console += '\nReceived: $text';
            });
          });
        }
      }
    }
  }

  Future<void> sendData(String message) async {
    if (targetCharacteristic != null) {
      await targetCharacteristic!.write(message.codeUnits);
      setState(() {
        console += '\nSent: $message';
      });
    }
  }

  @override
  void dispose() {
    connectedDevice?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pair Your Device')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: startScan,
              child: const Text('Scan for Devices'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: devicesList.length,
                itemBuilder: (context, index) {
                  final device = devicesList[index];
                  return ListTile(
                    title: Text(device.name.isNotEmpty
                        ? device.name
                        : device.id.id),
                    subtitle: Text(
                        connectedDevice == device ? 'Connected' : 'Tap to connect'),
                    onTap: () => connectDevice(device),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Send message',
              ),
              onSubmitted: (text) => sendData(text),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(console),
              ),
            ),
          ],
        ),
      ),
    );
  }
}