import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/scan_gauge.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/scan_stats.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/welcome_tile.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScanStats(),
              ScanGauge(),
            ],
          ).hPaddingx(8),
          // const Divider(
          //   thickness: .5,
          // ),
          Text(
            overflow: TextOverflow.ellipsis,
            'You can share your recent checkups with our medical experts',
            style: context.bodyLg.copyWith(
              fontSize: 14,
              //  color: context.scheme.primary,
            ),
          ).floatL.hPaddingx(8),
          Builder(
            builder: (context) {
              final images = <String>[
                userAvatar,
                userAvatar,
                userAvatar,
              ];
              return ImageStack(
                imageBorderWidth: 0,
                imageList: images,
                totalCount: images.length,
              );
            },
          ).hPaddingx(8),
          14.vGap,
          Container(
            height: 32,
            width: 100,
            decoration: BoxDecoration(
              color: context.scheme.primaryContainer,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(
                'See more',
                style: context.typography.bodyMedium!.copyWith(
                  color: context.scheme.primary,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ).floatR.hPadding,
          //  for (var i = 1; i < 5; i++) const CheckupTile(),
          // 14.vGap,
          // SizedBox(
          //   height: 114,
          //   child: ListView.builder(
          //     itemCount: 6,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (BuildContext context, int index) {
          //       return const CheckupBox();
          //     },
          //   ),
          // ),
          14.vGap,
        ],
      ),
    );
  }
}
