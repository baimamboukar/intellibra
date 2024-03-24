import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class FlutterBluePlusService {
  List<BluetoothDevice> devices = [];

  Future<Stream<List>> startScanning() async {
    await FlutterBluePlus.startScan();
    return FlutterBluePlus.scanResults ;
  }

  
}
