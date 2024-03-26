import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:intellibra/src/router/intellibra_router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FirstRunGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
      final isFirstRun =
          Hive.box('settings').get('isFirstRun', defaultValue: true) as bool;
      if (isFirstRun && !kIsWeb) {
        Hive.box('settings').put('isFirstRun', false);
        router.push(const Welcome());
      } else {
        resolver.next();
      }
    } 
  
}

class NotFirstRunGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isFirstRun =
        Hive.box('settings').get('isFirstRun', defaultValue: true) as bool;
    if (!isFirstRun || kIsWeb) {
      router.pushNamed('/');
    } else {
      resolver.next();
    }
  }
}
