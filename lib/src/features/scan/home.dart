import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
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
          return BottomNavigationBar(
            //elevation: 12,
            // selectedItemColor: Palette.primary,
            //unselectedItemColor: Palette.primary.withOpacity(.55),
            currentIndex: router.activeIndex,
            onTap: (index) => router.setActiveIndex(index),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.heart,
                  size: 18,
                ),
                label: 'selfcheck',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.shield_done,
                  size: 18,
                ),
                // backgroundColor: Palette.dark,
                label: 'awareness',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.folder,
                  size: 18,
                ),
                // backgroundColor: Palette.dark,
                label: 'records',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.user_2,
                  size: 18,
                ),
                // backgroundColor: Palette.dark,
                label: 'profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
