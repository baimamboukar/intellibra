import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellibra/src/utils/palette.dart';
import 'package:intellibra/src/utils/text_styles.dart';

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Center(
        child: Text(
          'Signup',
          style: TextStyles.designText(
              bold: true, color: Palette.primary, size: 18),
        ),
      ),
    );
  }
}
