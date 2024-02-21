import 'package:action_slider/action_slider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/extensions/build_context.dart';

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
        child: HeroIcon(
          HeroIcons.power,
          size: 22,
          color: context.scheme.onPrimary,
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
        await Future<void>.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          await showStickyFlexibleBottomSheet<void>(
            minHeight: 0,
            initHeight: 0.5,
            maxHeight: 1,
            headerHeight: 200,
            bottomSheetBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            context: context,
            headerBuilder: (BuildContext context, double offset) {
              return Container();
            },
            bodyBuilder: (BuildContext context, double offset) {
              return SliverChildListDelegate(
                <Widget>[
                  const Text('Hello'),
                  IntellibraButton(
                    text: 'Connect',
                    action: () {
                      context.router.pop();
                      controller
                        ..success()
                        ..reset();
                    },
                  ),
                ],
              );
            },
            anchors: [0, 0.5, 1],
          );
        }
      },
    );
  }
}
