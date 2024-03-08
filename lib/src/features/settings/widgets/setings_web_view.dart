import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/configs/intellibra_pathname.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/settings/widgets/action_tile.dart';
import 'package:intellibra/src/features/settings/widgets/profile_card.dart';

class SettingWebView extends StatelessWidget {
  const SettingWebView({
    required this.isLarge,
    super.key,
  });

  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: <Widget>[
            34.vGap,
            Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage(Assets.assetsIconsUser),
                radius: isLarge ? 120 : 50,
              ),
            ),
            4.vGap,
            ProfileCard(
              width: context.width * .4,
              children: [
                Text(
                  'Anzia Juvis',
                  style: context.theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'anzia.juvis@intellibra.io',
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
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            14.vGap,
            ProfileCard(
              width: context.width * .4,
              children: [
                Text(
                  'Intellibra Member Since',
                  style: context.theme.textTheme.titleSmall,
                ),
                Text(
                  'Feb 21, 2024',
                  style: context.theme.textTheme.bodyLarge,
                ),
              ],
            ),
            ProfileCard(
                            width: context.width * .4,

              children: [
                Text(
                  'Intellibra Settings',
                  style: context.theme.textTheme.titleSmall,
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
            //   34.vGap,
            //  const TradeMark(),
            8.vGap,
          ],
        ),
      ],
    );
  }
}
