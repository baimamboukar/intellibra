import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/widgetx.dart';

class DeviceSwitch extends StatelessWidget {
  const DeviceSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: context.width * .5,
      decoration: BoxDecoration(
        color: context.scheme.primary,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: context.scheme.background,
              shape: BoxShape.circle,
            ),
            child: const HeroIcon(
              HeroIcons.power,
              size: 22,
            ),
          ),
          const Spacer(),
          const Text('start scan'),
          const Spacer(),
          HeroIcon(
            HeroIcons.chevronDoubleRight,
            size: 18,
            color: context.scheme.background,
          ),
        ],
      ).hPaddingx(8).vPaddingx(8),
    );
  }
}
