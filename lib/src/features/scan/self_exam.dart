import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
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
            const DeviceBox(),
          ],
        ).hPadding,
      ),
    );
  }
}

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
            child: const Column(
              children: [
                Text('20%'),
              ],
            ).hPaddingx(8).vPaddingx(8),
          ),
          Container(
            width: 98,
            height: 180,
            decoration: BoxDecoration(
              color: context.scheme.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: const Center(
              child: Text('Scanner'),
            ),
          ),
        ],
      ),
    );
  }
}
