import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:intellibra/src/extensions/build_context.dart';

class DeviceStateSection extends StatelessWidget {
  const DeviceStateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      height: 34,
      width: context.width * .8,
      borderWidth: 0,
      borderColor: context.scheme.primaryContainer,
      borderRadius: BorderRadius.circular(28),
      blur: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  const Text('G23FBMX4'),
          Text(
            'Device State ・ ',
            style: context.bodySm,
          ),
          //  const Spacer(),

          Text(
            'Disconnected...',
            style: context.bodySm.copyWith(
              color: context.scheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
