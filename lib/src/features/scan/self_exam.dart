import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_box.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/recent_checkups.dart';
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
            28.vGap,
            const RecentChekups(),
          ],
        ).hPadding,
      ),
    );
  }
}
