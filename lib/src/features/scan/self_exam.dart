import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collectX/src/utils/palette.dart';
import 'package:collectX/src/utils/text_styles.dart';

class SelfCheck extends ConsumerWidget {
  const SelfCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Center(
        child: Text(
          'SelfCheck',
          style: TextStyles.designText(
              bold: true, color: Palette.primary, size: 18),
        ),
      ),
    );
  }
}
