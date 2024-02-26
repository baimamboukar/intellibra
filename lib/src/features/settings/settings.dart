import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/common/widgets/intellibra_button.dart';
import 'package:intellibra/src/common/widgets/mark.dart';
import 'package:intellibra/src/configs/intellibra_pathname.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/settings/widgets/action_tile.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IntellibraFlexibleButton(
                      text: 'Edit Profile',
                      color: context.scheme.primary.withOpacity(0.5),
                      icon: IconlyBroken.edit,
                      buttonRadius: 32,
                      action: () {},
                    ),
                    8.hGap,
                    IntellibraFlexibleButton(
                      text: 'Sign Out',
                      icon: IconlyBroken.logout,
                      color: context.scheme.primary.withOpacity(0.5),
                      buttonRadius: 32,
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
                  onTap: () =>
                      context.router.pushNamed(PathName.accountSettings),
                ),
                ActionLabelWithDivider(
                  icon: Hicons.card_1_bold,
                  label: 'Billing',
                  onTap: () =>
                      context.router.pushNamed(PathName.billingSettings),
                ),
                ActionLabel(
                  icon: Icons.phone_iphone,
                  label: 'App',
                  onTap: () => context.router.pushNamed(PathName.appSettings),
                ),
              ],
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
          color: context.scheme.onPrimary,
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
