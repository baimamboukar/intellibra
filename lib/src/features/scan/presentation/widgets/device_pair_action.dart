import 'package:action_slider/action_slider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';

class DevicePairAction extends StatelessWidget {
  const DevicePairAction({required this.controller, super.key});
  final ActionSliderController controller;

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      boxShadow: const [],
      height: 78,
      width: context.width * .75,
      icon: Container(
        height: 68,
        width: 68,
        decoration: BoxDecoration(
          color: context.scheme.primary,
          shape: BoxShape.circle,
        ),
        child: HeroIcon(
          HeroIcons.devicePhoneMobile,
          size: 22,
          color: context.scheme.onPrimary,
        ),
      ),
      customBackgroundBuilder: (context, state, child) {
        return GlassContainer.frostedGlass(
          height: 78,
          width: context.width * .75,
          borderWidth: 0,
          borderColor: context.scheme.primary,
          borderRadius: BorderRadius.circular(58),
          blur: 4,
          child: child,
        );
      },
      rolling: true,
      // sliderBehavior: SliderBehavior.stretch,
      customBackgroundBuilderChild: Padding(
        padding: const EdgeInsets.only(left: 74),
        child: Row(
          children: [
            const Text('Pair Device'),
            const Spacer(),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: context.scheme.primary.withOpacity(.35),
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: context.scheme.primary.withOpacity(.55),
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: context.scheme.primary,
            ),
          ],
        ),
      ),
      action: (secondController) async {
        controller
          ..success()
          ..reset();
        secondController.loading();

        Future.delayed(const Duration(seconds: 3), () async {
          secondController.success();
          await Future<void>.delayed(const Duration(milliseconds: 1200));
          // ignore: use_build_context_synchronously
          await context.router.pop();
        });
      },
    );
  }
}
