import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';

class CheckupBox extends StatelessWidget {
  const CheckupBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.scheme.primary,
          width: .5,
        ),
        color: context.scheme.onPrimary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0012JAN'),
              Icon(
                Icons.more_vert,
                size: 12,
              ),
            ],
          ),
          8.vGap,
          const Badge(
            label: Text('benign'),
          ),
          12.vGap,
          Row(
            children: [
              const Icon(
                Icons.medical_information_outlined,
                size: 12,
              ),
              2.hGap,
              const Text('Shots'),
              8.hGap,
              const Text('12'),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.timelapse_outlined,
                size: 12,
              ),
              2.hGap,
              const Text('Time'),
              8.hGap,
              const Text('3mins'),
            ],
          ),
        ],
      ).hPaddingx(8).vPaddingx(8),
    ).hPaddingx(8);
  }
}

class CheckupTile extends StatelessWidget {
  const CheckupTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      // contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,

      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: context.scheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: HeroIcon(
          HeroIcons.checkCircle,
          color: context.scheme.primary,
          size: 22,
        ),
      ),
      title: Text(
        '28 Jan 2024',
        style: context.bodySm.copyWith(
          color: context.colorScheme.primary,
          fontSize: 12,
        ),
      ),
      subtitle: Text(
        '20:30 PM',
        style: context.bodySm.copyWith(
          color: context.colorScheme.secondary,
          fontSize: 10,
        ),
      ),
    );
  }
}
