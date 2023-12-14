import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/common/widgets/mark.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/settings/widgets/action_tile.dart';
import 'package:intellibra/src/features/settings/widgets/language_dialog.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            34.vGap,
            Center(
              child: Image.asset(Assets.assetsIconsWomanPp),
            ),
            4.vGap,
            Center(
              child: Text(
                'Lady Bug Miraculous',
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
            14.vGap,
            const IntellibraButton(
              text: 'Edit Profile',
            ),
            34.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Intellibra actions',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                4.hGap,
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            ActionLabel(
              label: 'Intellibra scans',
              onTap: () {},
              icon: IconlyBroken.heart,
            ),
            ActionLabel(
              icon: Hicons.lock_1_bold,
              label: 'Pin code',
              onTap: () {},
            ),
            ActionLabel(
              icon: Icons.language,
              label: "Langue de l'application",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const IntelliDialog(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Usage',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                4.hGap,
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            ActionLabel(
              icon: IconlyBroken.work,
              label: 'Temrs & Conditions',
              onTap: () {
                context.router.pushNamed('/home');
              },
            ),
            ActionLabel(
              icon: Hicons.information_square_bold,
              label: 'Infos',
              onTap: () {
                context.router.pushNamed('/home');
              },
            ),
            34.vGap,
            const TradeMark(),
            8.vGap,
          ],
        ),
      ),
    );
  }
}
