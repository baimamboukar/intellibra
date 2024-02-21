import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/router/intellibra_router.gr.dart' as routes;

//TODO: #34 redesign navigation bar to give a new feel
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          routes.SelfCheck(),
          routes.Awareness(),
          routes.IntelliRecords(),
          routes.Settings(),
        ],
        builder: (context, child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        bottomNavigationBuilder: (context, router) {
          return NavigationBar(
            indicatorColor: context.scheme.primary.withOpacity(.25),
            //  backgroundColor: context.scheme.primary,
            destinations: const [
              NavigationDestination(
                icon: Icon(IconlyBroken.heart),
                label: 'Self-Check',
              ),
              NavigationDestination(
                icon: Icon(IconlyBroken.shield_done),
                label: 'Awareness',
              ),
              NavigationDestination(
                icon: Icon(IconlyBroken.folder),
                label: 'Records',
              ),
              NavigationDestination(
                icon: Icon(IconlyBroken.user_2),
                label: 'Profile',
              ),
            ],
            selectedIndex: router.activeIndex,
            onDestinationSelected: (index) => router.setActiveIndex(index),
          );
        },
      ),
    );
  }
}
