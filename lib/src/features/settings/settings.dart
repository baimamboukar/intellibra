import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/common/widgets/intellibra_button.dart';
import 'package:intellibra/src/common/widgets/mark.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/settings/widgets/action_tile.dart';
import 'package:intellibra/src/features/settings/widgets/language_dialog.dart';

//TODO: #36 redesign profile page to give a new feel
@RoutePage()
class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            34.vGap,
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.assetsIconsWoman),
                radius: 50,
              ),
            ),
            4.vGap,
            ProfileCard(
              children: [
                Text(
                  'Baima Boukara',
                  style: context.theme.textTheme.titleLarge,
                ),
                Text(
                  'baima@gmail.com',
                  style: context.theme.textTheme.bodyLarge,
                ),
                14.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntellibraButtonSmall(
                      text: 'Edit Profile',
                      icon: IconlyBroken.edit,
                      action: () {},
                    ),
                    8.hGap,
                    IntellibraButtonSmall(
                      text: 'Sign Out',
                      icon: IconlyBroken.logout,
                      action: () {},
                    ),
                  ],
                ),
              ],
            ),
            24.vGap,
            ProfileCard(
              children: [
                Text(
                  'Intellibra Member Since',
                  style: context.theme.textTheme.titleLarge,
                ),
                Text(
                  'Feb 21, 2024',
                  style: context.theme.textTheme.bodyLarge,
                ),
              ],
            ),
            ProfileCard(
              children: [
                const Text(
                  'Intellibra Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.vGap,
                ActionLabelWithDivider(
                  label: 'Account',
                  icon: IconlyBroken.profile,
                  onTap: () {},
                ),
                ActionLabelWithDivider(
                  icon: Hicons.card_1_bold,
                  label: 'Billing',
                  onTap: () {},
                ),
                ActionLabel(
                  icon: Icons.phone_iphone,
                  label: 'App',
                  onTap: () {},
                ),
              ],
            ),
            /* const Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            34.vGap,
            Center(
              child: Image.asset(
                Assets.assetsIconsWoman,
                height: 100,
              ),
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
            ), */
            34.vGap,
            const TradeMark(),
            8.vGap,
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.children,
    super.key,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.scheme.surface,
          borderRadius: BorderRadius.circular(16),
         /*  boxShadow: [
            BoxShadow(
              color: context.scheme.primary.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ], */
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
