import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/device_box.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/recent_checkups.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/welcome_tile.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

//TODO: #35 redesign self check page to make it modern
@RoutePage()
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
      
            if (kIsWeb && context.width > 800)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width * .4,
                    child: const DeviceBox(),
                  ),
                  28.hGap,
                  SizedBox(
                    width: context.width * .5,
                    child: const RecentChekups()),
                ],
              )
            else
              Column(
                children: [
                  const DeviceBox(),
                  28.vGap,
                  const RecentChekups(),
                ],
              ),
          ],
        ).hPadding,
      ),
    );
  }
}
