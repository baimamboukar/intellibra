import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_switch.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

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
                const _DeviceStateSection(),
                14.vGap,
                Text(
                  'Connect to Device',
                  style: context.bodySm.copyWith(
                    color: context.scheme.secondary,
                  ),
                ).floatL,
                const Spacer(),
                Visibility(
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
                ),
              ],
            ).hPaddingx(8).vPaddingx(8),
          ),
          Container(
            width: context.width * 0.35,
            height: 180,
            decoration: BoxDecoration(
              color: context.scheme.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: Container(
              width: context.width * 0.35,
              height: 180,
              decoration: BoxDecoration(
                color: context.scheme.primary.withOpacity(.34),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              child: Center(
                child: ShadowOverlay(
                  shadowHeight: 60,
                  shadowWidth: context.width * 0.35,
                  shadowColor: context.scheme.primary.withOpacity(0.9),
                  child: Image.asset(
                    Assets.assetsIconsIntellibra,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeviceStateSection extends StatelessWidget {
  const _DeviceStateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      height: 34,
      width: context.width * .8,
      borderWidth: 0,
      borderColor: context.scheme.primaryContainer,
      borderRadius: BorderRadius.circular(28),
      blur: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  const Text('G23FBMX4'),
          Text(
            'Device State ・ ',
            style: context.bodySm,
          ),
          //  const Spacer(),

          Text(
            'Scanning...',
            style: context.bodySm.copyWith(
              color: context.scheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
