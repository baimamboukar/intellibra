part of 'scan_cubit.dart';

@immutable
abstract class ScanState {}

class ScanInitial extends ScanState {}

class RequestPermissionInit extends ScanState {}

class RequestPermissionSuccess extends ScanState {}

class RequestPermissionFailure extends ScanState {
  RequestPermissionFailure({required this.message});
  final String message;
}

class TurnOnBluetoothInit extends ScanState {}

class TurnOnBluetoothSuccess extends ScanState {}

class TurnOnBluetoothFailure extends ScanState {
  TurnOnBluetoothFailure({required this.message});
  final String message;
}

class ScanDeviceInit extends ScanState {}

class ScanDeviceSuccess extends ScanState {
  ScanDeviceSuccess({required this.devices});
  final List<BluetoothDevice> devices;
}

class ScanDeviceFailure extends ScanState {
  ScanDeviceFailure({required this.message});
  final String message;
}

