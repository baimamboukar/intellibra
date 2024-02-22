import 'package:flutter/material.dart';
import 'package:intellibra/src/configs/intellibra_constants.dart';
import 'package:intellibra/src/configs/palette.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';

class IntellibraButton extends StatelessWidget {
  const IntellibraButton({
    required this.text,
    this.action,
    this.buttonRadius,
    this.color = Palette.primary,
    super.key,
    this.width = .9,
    this.icon,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final double width;
  final double? buttonRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: context.width * width,
        height: Constants.buttonHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(buttonRadius ?? Constants.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Palette.lightColor,
              ),
              8.hGap,
            ] else
              const SizedBox.shrink(),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: context.bodyLg.copyWith(
                color: context.scheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IntellibraButtonMedium extends StatelessWidget {
  const IntellibraButtonMedium({
    required this.text,
    this.action,
    this.color = Palette.primary,
    super.key,
    this.width = .35,
    this.icon,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return IntellibraButton(
      text: text,
      action: action,
      color: color,
      width: width,
      icon: icon,
    );
  }
}

class IntellibraButtonSmall extends StatelessWidget {
  const IntellibraButtonSmall({
    required this.text,
    this.action,
    this.color = Palette.primary,
    super.key,
    this.width = .30,
    this.icon,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return IntellibraButton(
      text: text,
      action: action,
      color: color,
      width: width,
      icon: icon,
      buttonRadius: 16,
    );
  }
}

class IntellibraFlexibleButton extends StatelessWidget {
  const IntellibraFlexibleButton({
    required this.text,
    this.action,
    this.buttonRadius,
    this.color = Palette.primary,
    super.key,
    this.icon,
    this.padding,

  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final double? buttonRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: Constants.buttonHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(buttonRadius ?? Constants.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
              ),
              8.hGap,
            ] else
              const SizedBox.shrink(),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: context.bodyLg.copyWith(
                color: context.scheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
