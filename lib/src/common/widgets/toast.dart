import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

toastWarning(BuildContext context, String message) {
  return toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 5),
    type: ToastificationType.warning,
  );
}

toastError(BuildContext context, String message) {
  return toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 5),
    type: ToastificationType.error,
  );
}

toastSuccess(BuildContext context, String message) {
  return toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 5),
    type: ToastificationType.success,
  );
}

toastInfo(BuildContext context, String message) {
  return toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 5),
    type: ToastificationType.info,
  );
}

toastLoading(BuildContext context, String message) {
  return toastification.show(
    context: context,
    title: Text(message),
        autoCloseDuration: const Duration(seconds: 5),
    type: ToastificationType.info,
    showProgressBar: true,
  );
}