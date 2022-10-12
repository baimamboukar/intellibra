import 'package:intellibra/src/utils/palette.dart';
import 'package:intellibra/src/utils/text_styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isPasswordVisibleRiverpod =
    StateProvider.autoDispose<bool>((ref) => false);

class Input extends ConsumerWidget {
  final TextEditingController controller;
  final TextInputType? type;
  final String label;
  final IconData icon;
  final bool isPassword;
  final String hint;
  final String? Function(String?)? validator;
  const Input(
      {Key? key,
      this.type,
      required this.controller,
      required this.label,
      required this.icon,
      required this.isPassword,
      required this.hint,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(isPasswordVisibleRiverpod);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 4.0),
              child: Text(
                label,
                style: TextStyles.designText(
                    bold: false, color: Palette.primary, size: 12),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 4),
        Container(
          height: 58.0,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: Palette.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Center(
            child: TextFormField(
              keyboardType: type,
              validator: validator,
              controller: controller,
              obscureText: isPassword && isPasswordVisible ? true : false,
              style: TextStyles.designText(
                  bold: false, color: Palette.dark.withOpacity(.5), size: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  icon,
                  color: Palette.primary,
                ),
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: () {
                          ref.read(isPasswordVisibleRiverpod.notifier).state =
                              !ref
                                  .read(isPasswordVisibleRiverpod.notifier)
                                  .state;
                        },
                        child: isPasswordVisible
                            ? const Icon(EvaIcons.eye)
                            : const Icon(EvaIcons.eyeOff),
                      )
                    : null,
                hintText: hint,
                hintStyle: TextStyles.designText(
                    bold: false, color: Palette.darkGrey, size: 12),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
