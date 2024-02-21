import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/connected_device.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_state.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_switch.dart';

class DeviceBox extends StatelessWidget {
  const DeviceBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: context.scheme.primaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const DeviceStateSection(),
                14.vGap,
                const Spacer(),
                const DeviceSwitch(),

                // const BottomAction(),
              ],
            ).hPaddingx(4).vPaddingx(8),
          ),
          const ConnectedDevice(),
        ],
      ),
    );
  }
}

class BottomAction extends StatelessWidget {
  const BottomAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      replacement: const DeviceSwitch(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIcon(
            HeroIcons.signal,
            color: context.scheme.primary,
            size: 22,
          ),
          4.hGap,
          Text(
            'Intellibra G23FB ',
            style: context.bodyMd.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
