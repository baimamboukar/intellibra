import 'package:flutter/material.dart';
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
            14.vGap,
            // const ScanHistory(),
            // 14.vGap,
            const DeviceBox(),
            28.vGap,
            Text(
              'Recent Checkups',
              style: context.typography.titleLarge!.copyWith(
                color: context.scheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ).floatL,
          ],
        ).hPadding,
      ),
    );
  }
}
