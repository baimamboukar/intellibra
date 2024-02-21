import 'package:flutter/material.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

class ConnectedDevice extends StatelessWidget {
  const ConnectedDevice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.3,
      height: 180,
      decoration: BoxDecoration(
        color: context.scheme.primary,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: Container(
        width: context.width * 0.35,
        height: 180,
        decoration: BoxDecoration(
          color: context.scheme.primary.withOpacity(.34),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              8.vGap,
              Text(
                'Intellibra',
                style: context.bodyLg.copyWith(
                  color: context.scheme.onPrimary,
                ),
              ),
              ShadowOverlay(
                shadowHeight: 60,
                shadowWidth: context.width * 0.35,
                shadowColor: context.scheme.primary.withOpacity(0.9),
                child: Image.asset(
                  Assets.assetsIconsIntellibra,
                ),
              ),
              8.vGap,
              Text(
                'CE12XFMZ',
                style: context.bodyMd.copyWith(
                  color: context.scheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
