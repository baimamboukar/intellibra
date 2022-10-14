import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/router/router.gr.dart';
import 'package:intellibra/src/utils/palette.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          Intellibra(),
          SelfCheck(),
          Awareness(),
          Records(),
        ],
        builder: (context, child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        bottomNavigationBuilder: (context, router) {
          return ValueListenableBuilder(
            valueListenable: Hive.box('userBox').listenable(),
            builder: (BuildContext context, Box box, Widget? widget) =>
                BottomNavigationBar(
              elevation: 12,
              backgroundColor:
                  box.get('theme') ? Palette.backgroundDark : Palette.lightGrey,
              selectedItemColor: Palette.primary,
              unselectedItemColor: Palette.primary.withOpacity(.55),
              currentIndex: router.activeIndex,
              onTap: (index) => router.setActiveIndex(index),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.scan,
                    size: 18,
                  ),
                  label: "intellibra",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.heart,
                    size: 18,
                  ),
                  label: "selfcheck",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.shield_done,
                    size: 18,
                  ),
                  backgroundColor: Palette.dark,
                  label: "awareness",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.folder,
                    size: 18,
                  ),
                  backgroundColor: Palette.dark,
                  label: "records",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
