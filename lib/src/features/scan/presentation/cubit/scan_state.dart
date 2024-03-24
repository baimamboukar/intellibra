// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scan_cubit.dart';

@immutable
abstract class ScanState {
  final List<BluetoothDevice> devices;
  final bool? isBlueOn;
  final String message;
  const ScanState({
    this.devices = const [],
    this.isBlueOn,
    this.message = '',
  });
}

class ScanInitial extends ScanState {}

class ScanChangeBlueState extends ScanState {
  const ScanChangeBlueState({required super.isBlueOn});
}

class RequestPermissionInit extends ScanState {}

class RequestPermissionSuccess extends ScanState {}

class RequestPermissionFailure extends ScanState {
  const RequestPermissionFailure({required this.message});
  final String message;
}

class TurnOnBluetoothInit extends ScanState {}

class TurnOnBluetoothSuccess extends ScanState {}

class TurnOnBluetoothFailure extends ScanState {
  const TurnOnBluetoothFailure({required this.message});
  final String message;
}

class ScanDeviceInit extends ScanState {}

class ScanDeviceSuccess extends ScanState {
  const ScanDeviceSuccess({
    required super.devices,
  });
}

class ScanAddDeviceState extends ScanState {
  const ScanAddDeviceState({required super.devices});
}

class ScanAddDeviceFailureState extends ScanState {
  const ScanAddDeviceFailureState({required super.message});
}

class ScanDeviceFailure extends ScanState {
  const ScanDeviceFailure({required this.message});
  final String message;
}

class ScanDeviceConnectInit extends ScanState {}

class ScanDeviceConnectFailure extends ScanState {
  const ScanDeviceConnectFailure({required super.message});
}


class ScanDeviceConnectSuccess extends ScanState{
  
}