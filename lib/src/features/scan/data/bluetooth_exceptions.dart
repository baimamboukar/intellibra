class BlueToothTurnException implements Exception {

  BlueToothTurnException([this.message = "the bluetooth couldn't be turned on"]);
  final String message;
}

class BlueToothPermissionException implements Exception {

  BlueToothPermissionException(
      [this.message = "the bluetooth permission couldn't be granted",]);
  final String message;
}

class BlueToothScanException implements Exception {

  BlueToothScanException(
      [this.message = "the bluetooth couldn't scanned for devices",]);
  final String message;
}

class BlueToothTurnOffException implements Exception {

  BlueToothTurnOffException(
      [this.message = "the bluetooth couldn't be turned off",]);
  final String message;
}

class BlueToothDisconnectException implements Exception {

  BlueToothDisconnectException(
      [this.message = "the bluetooth couldn't be disconnected",]);
  final String message;
}