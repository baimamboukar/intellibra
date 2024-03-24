import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:intellibra/src/extensions/object.dart';
import 'package:intellibra/src/features/scan/domain/scan_repository.dart';
import 'package:meta/meta.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());
  final repo = ScanRepository();
  StreamSubscription? _scanDevicesSubscription;

  Future<void> requestPermission() async {
    emit(RequestPermissionInit());
    try {
      await repo.permissionRequest();

      emit(RequestPermissionSuccess());
    } catch (e) {
      emit(RequestPermissionFailure(message: e.toString()));
    }
  }

  Future<void> turnOnBluetooth() async {
    emit(TurnOnBluetoothInit());
    try {
      await repo.bluetoothTurnOn();
      emit(TurnOnBluetoothSuccess());
    } catch (e) {
      emit(TurnOnBluetoothFailure(message: e.toString()));
    }
  }

  Future<void> checkBlueState() async {
    FlutterBluePlus.adapterState.listen((state) {
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
        emit(const ScanChangeBlueState(isBlueOn: true));
      } else {
        emit(const ScanChangeBlueState(isBlueOn: false));
        // show an error to the user, etc
      }
    });
  }

  Future<void> scanDevices() async {
    emit(ScanDeviceInit());

    try {
      if (state.isBlueOn == true) {
        await FlutterBluePlus.startScan();

        FlutterBluePlus.scanResults.listen((results) {
          for (final result in results) {
            if (!state.devices.contains(result.device)) {
              final newDevice = [...state.devices, result.device];
              emit(ScanAddDeviceState(devices: newDevice));
            }
          }
        });
      } else {
        emit(
          const ScanAddDeviceFailureState(
            message: 'Please Turn on your Bluetooth',
          ),
        );
      }
      // _scanDevicesSubscription =
      //     Stream.periodic(const Duration(seconds: 2)).asyncMap((_) async {
      //   try {
      //     await repo.startScan();
      //     final devices = repo.service.connectedDevices;
      //     emit(ScanDeviceSuccess(devices: devices));
      //     return devices;
      //   } catch (e) {
      //     emit(ScanDeviceFailure(message: e.toString()));
      //   }
      // }).listen((event) {
      //   if (event != null) {
      //     print('${event.toList()}');
      //     emit(ScanDeviceSuccess(devices: event));
      //   }
      // });
      /* final devices = await repo.service.connectedDevices;
      emit(ScanDeviceSuccess(devices: devices)); */
    } catch (e) {
      //emit(ScanDeviceFailure(message: e.toString()));
    }
  }

  Future<void> readCharacteristics(BluetoothDevice device) async {
    final services = device.servicesList;
    for (final service in services) {
      debugPrint('this is a service: ${service.serviceUuid}');
      for (final characteristic in service.characteristics) {
        debugPrint(
          'this is a characteristic of the ${service.serviceUuid} service : ${service.serviceUuid} characteristic',
        );
        final value = await characteristic.read();
        print('Read value: $value');
      }
    }
  }

  Future<void> connectDevice(BluetoothDevice device) async {
    emit(ScanDeviceConnectInit());
    try {
      await device.connect(autoConnect: true);
      await readCharacteristics(device);
      emit(ScanDeviceConnectSuccess());
    } catch (e) {
      debugPrint('connect device error: $e');
      emit(
        const ScanDeviceConnectFailure(
          message: 'please try later and check your bluetooth',
        ),
      );
    }
  }
}
