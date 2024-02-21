import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_box.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/welcome_tile.dart';

//TODO: #35 redesign self check page to make it modern
class SelfCheck extends StatelessWidget {
  const SelfCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            24.vGap,

            const WelcomeTile(),

            24.vGap,
            //const DeviceSwitch(),
            //24.vGap,
            // const ScanHistory(),
            14.vGap,
            const DeviceBox(),
            //28.vGap,
            // const RecentChekups(),
          ],
        ).hPadding,
      ),
    );
  }
}

class RecentChekups extends StatelessWidget {
  const RecentChekups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // height: 200,
      decoration: BoxDecoration(
        color: context.scheme.onPrimary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text(
            'Recent Checkups',
            style: context.typography.titleLarge!.copyWith(
              color: context.scheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ).floatL,
          for (var i = 1; i < 3; i++)
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: context.scheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: HeroIcon(
                  HeroIcons.sparkles,
                  color: context.scheme.primary,
                  size: 22,
                ),
              ),
              title: const Text('Anzia Juvis'),
              subtitle: Text(
                'Reviewed by Dr. Shiva',
                style: context.bodySm.copyWith(
                  color: context.colorScheme.secondary,
                  fontSize: 12,
                ),
              ),
            ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: context.scheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: HeroIcon(
                HeroIcons.sparkles,
                color: context.scheme.primary,
                size: 22,
              ),
            ),
            title: const Text('Anzia Juvis'),
            subtitle: Text(
              'Reviewed by Dr. Shiva',
              style: context.bodySm.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ).hPadding.vPadding,
    );
  }
}
