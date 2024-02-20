import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Padding get vPadding => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: this,
      );
  Padding get hPadding => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: this,
      );
  Padding hPaddingx(double x) => Padding(
        padding: EdgeInsets.symmetric(horizontal: x),
        child: this,
      );
  Padding vPaddingx(double x) => Padding(
        padding: EdgeInsets.symmetric(vertical: x),
        child: this,
      );
}
