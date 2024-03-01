import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';

class ScanStats extends StatelessWidget {
  const ScanStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: context.scheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: HeroIcon(
                HeroIcons.sparkles,
                color: context.scheme.primary,
                size: 14,
              ),
            ),
            4.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Checkups',
                  style: context.typography.bodyMedium!.copyWith(
                    color: context.scheme.primary,
                    //fontWeight: FontWeight.bold,
                  ),
                ).floatL,
                Text(
                  'Checkups this month',
                  style: context.typography.bodySmall!.copyWith(
                    color: context.scheme.secondary,
                    fontSize: 10,
                    //fontWeight: FontWeight.bold,
                  ),
                ).floatL,
              ],
            ),
          ],
        ),
        // const ScanHistory(),
        8.vGap,
        Row(
          children: [
            Text(
              '02',
              style: context.typography.displayMedium!.copyWith(
                color: context.scheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -10.5),
              child: Text(
                'scans',
                style: context.bodyLg.copyWith(
                  fontSize: 14,
                  color: context.scheme.primary,
                ),
              ),
            ),
          ],
        ),
        // Text(
        //   'You are still to take 2 checkups this month',
        //   style: context.bodyLg.copyWith(
        //     fontSize: 12,
        //     color: context.scheme.primary,
        //   ),
        // ),
      ],
    );
  }
}
