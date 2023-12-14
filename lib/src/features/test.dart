// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

final snackBarKeyA = GlobalKey<ScaffoldMessengerState>();
final snackBarKeyB = GlobalKey<ScaffoldMessengerState>();
final snackBarKeyC = GlobalKey<ScaffoldMessengerState>();

void main() {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
    ].request().then((status) {
      runApp(const FlutterBlueApp());
    });
  } else {
    runApp(const FlutterBlueApp());
  }
}

class FlutterBlueApp extends StatelessWidget {
  const FlutterBlueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color: Colors.lightBlue,
      body: StreamBuilder<BluetoothAdapterState>(
        stream: FlutterBluePlus.adapterState,
        initialData: BluetoothAdapterState.unknown,
        builder: (c, snapshot) {
          final adapterState = snapshot.data;
          if (adapterState == BluetoothAdapterState.on) {
            return const FindDevicesScreen();
          }
          return BluetoothOffScreen(adapterState: adapterState);
        },
      ),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({super.key, this.adapterState});

  final BluetoothAdapterState? adapterState;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyA,
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.bluetooth_disabled,
                size: 200,
                color: Colors.white54,
              ),
              Text(
                'Bluetooth Adapter is ${adapterState != null ? adapterState.toString().split(".").last : 'not available'}.',
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(color: Colors.white),
              ),
              ElevatedButton(
                child: const Text('TURN ON'),
                onPressed: () async {
                  try {
                    if (Platform.isAndroid) {
                      await FlutterBluePlus.turnOn();
                    }
                  } catch (e) {
                    final snackBar = SnackBar(
                      content: Text(prettyException('Error Turning On:', e)),
                    );
                    snackBarKeyA.currentState?.showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  const FindDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyB,
      child: Scaffold(
        floatingActionButton: StreamBuilder<bool>(
          stream: FlutterBluePlus.isScanning,
          initialData: false,
          builder: (c, snapshot) {
            if (snapshot.data!) {
              return FloatingActionButton(
                onPressed: () async {
                  try {
                    await FlutterBluePlus.stopScan();
                  } catch (e) {
                    final snackBar = SnackBar(
                      content: Text(prettyException('Stop Scan Error:', e)),
                    );
                    snackBarKeyB.currentState?.showSnackBar(snackBar);
                  }
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.stop),
              );
            } else {
              return FloatingActionButton(
                child: const Icon(Icons.search),
                onPressed: () async {
                  try {
                    await FlutterBluePlus.startScan(
                      timeout: const Duration(seconds: 15),
                    );
                  } catch (e) {
                    final snackBar = SnackBar(
                      content: Text(prettyException('Start Scan Error:', e)),
                    );
                    snackBarKeyB.currentState?.showSnackBar(snackBar);
                  }
                },
              );
            }
          },
        ),
        appBar: AppBar(
          title: const Text('Find Devices'),
          actions: [
            if (Platform.isAndroid)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  try {
                    if (Platform.isAndroid) {
                      await FlutterBluePlus.turnOff();
                    }
                  } catch (e) {
                    final snackBar = SnackBar(
                      content: Text(prettyException('Error Turning On:', e)),
                    );
                    snackBarKeyB.currentState?.showSnackBar(snackBar);
                  }
                },
                child: const Text('TURN OFF'),
              ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => FlutterBluePlus.startScan(
            timeout: const Duration(seconds: 15),
            //includeConnectedDevices: true,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(const Duration(seconds: 2))
                      .asyncMap((_) => FlutterBluePlus.connectedDevices),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map(
                          (d) => ListTile(
                            title: Text(d.localName),
                            subtitle: Text(d.remoteId.toString()),
                            trailing: StreamBuilder<BluetoothConnectionState>(
                              stream: d.connectionState,
                              initialData:
                                  BluetoothConnectionState.disconnected,
                              builder: (c, snapshot) {
                                if (snapshot.data ==
                                    BluetoothConnectionState.connected) {
                                  return ElevatedButton(
                                    child: const Text('OPEN'),
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DeviceScreen(device: d),
                                      ),
                                    ),
                                  );
                                }
                                return Text(snapshot.data.toString());
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBluePlus.scanResults,
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: [
                      ...snapshot.data!.map(
                        (r) {
                          final result = r;
                          return ListTile(
                            //result: r,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  r.device.connect().catchError((e) {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        prettyException('Connect Error:', e),
                                      ),
                                    );
                                    snackBarKeyB.currentState
                                        ?.showSnackBar(snackBar);
                                  });
                                  return DeviceScreen(device: r.device);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({required this.device, super.key});

  final BluetoothDevice device;

  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
    ];
  }

  // List<Widget> _buildServiceTiles(
  //     BuildContext context, List<BluetoothService> services) {
  //   return services
  //       .map(
  //         (s) =>  ListTile(
  //          // service: s,
  //           characteristicTiles: s.characteristics
  //               .map(
  //                 (c) => CharacteristicTile(
  //                   characteristic: c,
  //                   onReadPressed: () async {
  //                     try {
  //                       await c.read();
  //                     } catch (e) {
  //                       final snackBar = SnackBar(
  //                           content: Text(prettyException("Read Error:", e)));
  //                       snackBarKeyC.currentState?.showSnackBar(snackBar);
  //                     }
  //                   },
  //                   onWritePressed: () async {
  //                     try {
  //                       await c.write(_getRandomBytes(), withoutResponse: true);
  //                       if (c.properties.read) {
  //                         await c.read();
  //                       }
  //                     } catch (e) {
  //                       final snackBar = SnackBar(
  //                           content: Text(prettyException("Write Error:", e)));
  //                       snackBarKeyC.currentState?.showSnackBar(snackBar);
  //                     }
  //                   },
  //                   onNotificationPressed: () async {
  //                     try {
  //                       await c.setNotifyValue(!c.isNotifying);
  //                       if (c.properties.read) {
  //                         await c.read();
  //                       }
  //                     } catch (e) {
  //                       final snackBar = SnackBar(
  //                           content:
  //                               Text(prettyException("Subscribe Error:", e)));
  //                       snackBarKeyC.currentState?.showSnackBar(snackBar);
  //                     }
  //                   },
  //                   descriptorTiles: c.descriptors
  //                       .map(
  //                         (d) => DescriptorTile(
  //                           descriptor: d,
  //                           onReadPressed: () async {
  //                             try {
  //                               await d.read();
  //                             } catch (e) {
  //                               final snackBar = SnackBar(
  //                                   content: Text(
  //                                       prettyException("Read Error:", e)));
  //                               snackBarKeyC.currentState
  //                                   ?.showSnackBar(snackBar);
  //                             }
  //                           },
  //                           onWritePressed: () async {
  //                             try {
  //                               await d.write(_getRandomBytes());
  //                             } catch (e) {
  //                               final snackBar = SnackBar(
  //                                   content: Text(
  //                                       prettyException("Write Error:", e)));
  //                               snackBarKeyC.currentState
  //                                   ?.showSnackBar(snackBar);
  //                             }
  //                           },
  //                         ),
  //                       )
  //                       .toList(),
  //                 ),
  //               )
  //               .toList(),
  //         ),
  //       )
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyC,
      child: Scaffold(
        appBar: AppBar(
          title: Text(device.localName),
          actions: <Widget>[
            StreamBuilder<BluetoothConnectionState>(
              stream: device.connectionState,
              initialData: BluetoothConnectionState.connecting,
              builder: (c, snapshot) {
                VoidCallback? onPressed;
                String text;
                switch (snapshot.data) {
                  case BluetoothConnectionState.connected:
                    onPressed = () async {
                      try {
                        await device.disconnect();
                      } catch (e) {
                        final snackBar = SnackBar(
                          content:
                              Text(prettyException('Disconnect Error:', e)),
                        );
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                    };
                    text = 'DISCONNECT';
                    break;
                  case BluetoothConnectionState.disconnected:
                    onPressed = () async {
                      try {
                        await device.connect();
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text(prettyException('Connect Error:', e)),
                        );
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                    };
                    text = 'CONNECT';
                    break;
                  default:
                    onPressed = null;
                    text =
                        snapshot.data.toString().split('.').last.toUpperCase();
                    break;
                }
                return TextButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<BluetoothConnectionState>(
                stream: device.connectionState,
                initialData: BluetoothConnectionState.connecting,
                builder: (c, snapshot) => ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (snapshot.data == BluetoothConnectionState.connected)
                        const Icon(Icons.bluetooth_connected)
                      else
                        const Icon(Icons.bluetooth_disabled),
                      if (snapshot.data == BluetoothConnectionState.connected)
                        StreamBuilder<int>(
                          stream: rssiStream(),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.hasData ? '${snapshot.data}dBm' : '',
                              style: Theme.of(context).textTheme.bodySmall,
                            );
                          },
                        )
                      else
                        Text(
                          '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                  title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.',
                  ),
                  subtitle: Text('${device.remoteId}'),
                  trailing: StreamBuilder<bool>(
                    stream: device.isDiscoveringServices,
                    initialData: false,
                    builder: (c, snapshot) => IndexedStack(
                      index: snapshot.data! ? 1 : 0,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Discover Services'),
                          onPressed: () async {
                            try {
                              await device.discoverServices();
                            } catch (e) {
                              final snackBar = SnackBar(
                                content: Text(
                                  prettyException(
                                    'Discover Services Error:',
                                    e,
                                  ),
                                ),
                              );
                              snackBarKeyC.currentState?.showSnackBar(snackBar);
                            }
                          },
                        ),
                        const IconButton(
                          icon: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.grey),
                            ),
                          ),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              StreamBuilder<int>(
                stream: device.mtu,
                initialData: 0,
                builder: (c, snapshot) => ListTile(
                  title: const Text('MTU Size'),
                  subtitle: Text('${snapshot.data} bytes'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      try {
                        await device.requestMtu(223);
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text(
                            prettyException('Change Mtu Error:', e),
                          ),
                        );
                        snackBarKeyC.currentState?.showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
              ),
              StreamBuilder<List<BluetoothService>>(
                stream: device.servicesStream,
                initialData: const [],
                builder: (c, snapshot) {
                  return const Column(
                    children: [Text('Services tiles')],
                    //_buildServiceTiles(context, snapshot.data!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<int> rssiStream({
    Duration frequency = const Duration(seconds: 1),
  }) async* {
    var isConnected = true;
    final subscription = device.connectionState.listen((v) {
      isConnected = v == BluetoothConnectionState.connected;
    });
    while (isConnected) {
      try {
        yield await device.readRssi();
      } catch (e) {
        print('Error reading RSSI: $e');
        break;
      }
      await Future.delayed(frequency);
    }
    // Device disconnected, stopping RSSI stream
    await subscription.cancel();
  }
}

String prettyException(String prefix, dynamic e) {
  if (e is FlutterBluePlusException) {
    return '$prefix ${e.errorString}';
  } else if (e is PlatformException) {
    return '$prefix ${e.message}';
  }
  return e.toString();
}
