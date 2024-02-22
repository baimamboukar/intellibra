import 'package:action_slider/action_slider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_pair_action.dart';

class DeviceSwitch extends StatelessWidget {
  const DeviceSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      boxShadow: const [],
      height: 58,
      width: context.width * .55,
      icon: Container(
        height: 68,
        width: 68,
        decoration: BoxDecoration(
          color: context.scheme.primary,
          shape: BoxShape.circle,
        ),
        child: GlassContainer.frostedGlass(
          height: 68,
          width: 68,
          blur: 14,
          shape: BoxShape.circle,
          child: HeroIcon(
            HeroIcons.power,
            size: 22,
            color: context.scheme.onPrimary,
          ),
        ),
      ),
      customBackgroundBuilder: (context, state, child) {
        return GlassContainer.frostedGlass(
          height: 58,
          width: context.width * .55,
          borderWidth: 0,
          borderColor: context.scheme.primaryContainer,
          borderRadius: BorderRadius.circular(58),
          blur: 12,
          child: child,
        );
      },
      sliderBehavior: SliderBehavior.stretch,
      customBackgroundBuilderChild: Padding(
        padding: const EdgeInsets.only(left: 54),
        child: Row(
          children: [
            const Text('Connect'),
            const Spacer(),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 14,
              color: context.scheme.primary.withOpacity(.35),
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: context.scheme.primary.withOpacity(.55),
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 20,
              color: context.scheme.primary,
            ),
          ],
        ),
      ),
      action: (controller) async {
        controller.loading();
        await Future<void>.delayed(const Duration(seconds: 1));
        if (context.mounted) {
          await showFlexibleBottomSheet<void>(
            minHeight: 0,
            initHeight: 0.75,
            maxHeight: 1,
            bottomSheetColor: context.colorScheme.onPrimary,
            bottomSheetBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(38),
              topRight: Radius.circular(38),
            ),
            context: context,
            builder: (BuildContext context, scroller, double offset) {
              return DevicePairing(controller: controller);
            },
            anchors: [0, 0.5, .75, 1],
          );
        }
      },
    );
  }
}

class DevicePairing extends StatefulWidget {
  const DevicePairing({
    required this.controller,
    super.key,
  });
  final ActionSliderController controller;

  @override
  State<DevicePairing> createState() => _DevicePairingState();
}

class _DevicePairingState extends State<DevicePairing> {
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Device Pairing',
          style: context.bodyLg.copyWith(
            color: context.scheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        18.vGap,
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.004)
            ..rotateY(angle),
          alignment: Alignment.center,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                angle += details.delta.dx * 0.01;
              });
            },
            child: Image.asset(
              Assets.assetsIconsIntellibra,
              height: 180,
              width: 180,
            ),
          ),
        ),
        18.vGap,
        Text(
          'Device Infos',
          style: context.bodyLg.copyWith(
            color: context.scheme.tertiary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ).floatL.hPaddingx(8),
        8.vGap,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DeviceInfoBox(
              info: 'Device Size',
              value: '32',
              unit: 'XXL',
              icon: HeroIcons.scissors,
            ),
            DeviceInfoBox(
              info: 'Device Battery',
              value: '48',
              unit: '%',
              icon: HeroIcons.battery50,
            ),
            DeviceInfoBox(
              info: 'Capacity',
              value: '128',
              unit: 'volts',
              icon: HeroIcons.bolt,
            ),
          ],
        ),
        const Spacer(),
        DevicePairAction(
          controller: widget.controller,
        ),
      ],
    ).hPadding.vPadding;
  }
}

class DeviceInfoBox extends StatelessWidget {
  const DeviceInfoBox({
    required this.info,
    required this.value,
    required this.unit,
    required this.icon,
    super.key,
  });
  final String info;
  final String value;
  final String unit;
  final HeroIcons icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: (context.width / 3) - 14,
      decoration: BoxDecoration(
        color: context.scheme.tertiary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroIcon(
            icon,
            size: 20,
            color: context.scheme.onPrimary,
          ),
          8.vGap,
          Text(
            info,
            style: context.bodySm.copyWith(
              color: context.scheme.onPrimary,
            ),
          ),
          8.vGap,
          Row(
            children: [
              Text(
                value,
                style: context.titleLg.copyWith(
                  color: context.scheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              4.hGap,
              Text(
                unit,
                style: context.bodySm.copyWith(
                  color: context.scheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ).hPaddingx(8).vPaddingx(8),
    );
  }
}
