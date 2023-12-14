import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/features/onboarding/thememode/cubit/theme_cubit.dart';
import 'package:intellibra/src/features/scan/presentation/widgets/intellibra_controller.dart';
import 'package:intellibra/src/features/test.dart';

class SelfCheck extends StatelessWidget {
  const SelfCheck({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return const Scaffold(
          // appBar: AppBar(
          //   title: const Text('Intellibra Widgets'),
          //   actions: [
          //     CupertinoSwitch(
          //       value: state,
          //       activeColor: context.scheme.tertiary,
          //       onChanged: (theme) {
          //         state == true
          //             ? context.read<ThemeCubit>().reset()
          //             : context.read<ThemeCubit>().toggle();
          //       },
          //     ),
          //   ],
          // ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _IntellibraStateBox(
                      message: '22%',
                      icon: Hicons.battery_charging_bold,
                    ),
                    IntellibraController(),
                    _IntellibraStateBox(
                      message: 'On',
                      icon: Hicons.wifi_bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _IntellibraStateBox extends StatelessWidget {
  const _IntellibraStateBox({
    required this.message,
    required this.icon,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const FlutterBlueApp()));
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: context.scheme.primary,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon), Text(message)],
        ),
      ),
    );
  }
}
