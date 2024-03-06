import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/router/intellibra_router.gr.dart' as routes;
import 'package:flutter/foundation.dart' show kIsWeb;

//TODO: #34 redesign navigation bar to give a new feel
@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: AutoTabsScaffold(
          routes: const [
            routes.SelfCheck(),
            routes.Awareness(),
            routes.IntelliRecords(),
            routes.Settings(),
          ],
          appBarBuilder: !kIsWeb
              ? null
              : (context, router) {
                  return TabBar(
                    indicatorColor: context.scheme.primary.withOpacity(.25),
                    //  backgroundColor: context.scheme.primary,
                    tabs: const [
                      Tab(
                        icon: Icon(IconlyBroken.heart),
                        text: 'Self-Check',
                      ),
                      Tab(
                        icon: Icon(IconlyBroken.shield_done),
                        text: 'Awareness',
                      ),
                      Tab(
                        icon: Icon(IconlyBroken.folder),
                        text: 'Records',
                      ),
                      Tab(
                        icon: Icon(IconlyBroken.user_2),
                        text: 'Profile',
                      ),
                    ],
                    // sel: router.activeIndex,
                    onTap: (index) => router.setActiveIndex(index),
                  );
                },
          floatingActionButtonBuilder: (context, router) {
            if (router.activeIndex == 0) {
              return FloatingActionButton(
                onPressed: () {
                  context.router.push(const routes.ChatRoute());
                },
                child: const HeroIcon(HeroIcons.sparkles),
              );
            }
            return null;
          },
          transitionBuilder: (context, child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          bottomNavigationBuilder: kIsWeb
              ? null
              : (context, router) {
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
                    onDestinationSelected: (index) =>
                        router.setActiveIndex(index),
                  );
                },
        ),
      ),
    );
  }
}
