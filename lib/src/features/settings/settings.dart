import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/features/settings/widgets/setings_web_view.dart';
import 'package:intellibra/src/features/settings/widgets/settings_mobile_view.dart';

//TODO: #36 redesign profile page to give a new feel
@RoutePage()
class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    final isLarge = context.mediaQuery.size.width >= 650;
    return Scaffold(
      body: SingleChildScrollView(
        child: isLarge
            ? SettingWebView(isLarge: isLarge)
            : SettingMobileView(isLarge: isLarge),
      ),
    );
  }
}
