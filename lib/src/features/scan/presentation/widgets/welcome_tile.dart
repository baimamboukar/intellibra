import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';

const userAvatar =
    'https://unsplash.com/photos/women-holding-her-collar-standing-near-wall-J1OScm_uHUQ';

class WelcomeTile extends StatelessWidget {
  const WelcomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            userAvatar,
          ),
        ),
        12.hGap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Anzia Juvis'),
            Text(
              'Welcome Back 👋',
              style: context.bodyLg.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const Spacer(),
        const _NotificationsAction(),
      ],
    );
  }
}

class _NotificationsAction extends StatelessWidget {
  const _NotificationsAction();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 54,
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Badge(
          offset: const Offset(5, -5),
          label: const Text('2'),
          child: HeroIcon(
            HeroIcons.bell,
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
