import 'package:auto_route/auto_route.dart';
import 'package:intellibra/src/router/guards/auth_guard.dart';
import 'package:intellibra/src/screens/screens.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Login, path: '/login', initial: false),
    AutoRoute(page: Signup, path: '/signup', initial: false),
    AutoRoute(page: Welcome, path: '/welcome', initial: false),
    AutoRoute(
      page: Home,
      path: '/home',
      guards: [
        AuthGuard,
      ],
      children: [
        AutoRoute(page: Intellibra, path: 'intellibra'),
        AutoRoute(page: SelfCheck, path: 'selfcheck'),
        AutoRoute(page: Awareness, path: 'awareness'),
        AutoRoute(page: Records, path: 'records'),
      ],
    ),
  ],
)
class $AppRouter {}
