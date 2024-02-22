import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';

class ActionsList extends StatelessWidget {
  const ActionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _HomeActionBox(
            title: 'Find Hospitals',
            color: context.colorScheme.primaryContainer,
            icon: HeroIcon(
              HeroIcons.buildingOffice2,
              color: context.colorScheme.onBackground,
            ),
            callback: () {},
          ),
          _HomeActionBox(
            title: 'My Calendar',
            color: context.colorScheme.primaryContainer,
            icon: HeroIcon(
              HeroIcons.calendarDays,
              color: context.colorScheme.onBackground,
            ),
            callback: () {},
          ),
          _HomeActionBox(
            color: context.colorScheme.primaryContainer,
            title: 'Find Doctors',
            icon: HeroIcon(
              HeroIcons.deviceTablet,
              color: context.colorScheme.onBackground,
            ),
            callback: () {},
          ),
          _HomeActionBox(
            color: context.colorScheme.primary,
            title: 'More',
            icon: HeroIcon(
              HeroIcons.squares2x2,
              color: context.colorScheme.onBackground,
            ),
            callback: () {},
          ),
        ],
      ).hPadding.vPadding,
    );
  }
}

class _HomeActionBox extends StatelessWidget {
  const _HomeActionBox({
    required this.title,
    required this.icon,
    required this.callback,
    required this.color,
  });

  final String title;
  final Widget icon;
  final VoidCallback callback;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 94,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          // shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            4.vGap,
            Text(
              title,
              style: context.typography.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ).hPaddingx(4),
    );
  }
}
