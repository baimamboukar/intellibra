import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
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

  Future<void> scanDevices() async {
    emit(ScanDeviceInit());
    try {
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
}
