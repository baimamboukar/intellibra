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
      width: context.width * .68,
      decoration: BoxDecoration(
        color: context.scheme.primary.withOpacity(.3),
        borderRadius: BorderRadius.circular(58),
      ),
      child: Row(
        children: [
          Container(
            height: 68,
            width: 68,
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
      ).hPaddingx(1).vPaddingx(8),
    );
  }
}
