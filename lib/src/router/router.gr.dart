// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:intellibra/src/models/post_model.dart' as _i6;
import 'package:intellibra/src/router/guards/auth_guard.dart' as _i5;
import 'package:intellibra/src/screens/awareness_detail.dart' as _i2;
import 'package:intellibra/src/screens/screens.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter({
    _i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i5.AuthGuard authGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Login.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Login(),
      );
    },
    Signup.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Signup(),
      );
    },
    Welcome.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Home(),
      );
    },
    AwarenessDetail.name: (routeData) {
      final args = routeData.argsAs<AwarenessDetailArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.AwarenessDetail(post: args.post),
      );
    },
    Intellibra.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Intellibra(),
      );
    },
    SelfCheck.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SelfCheck(),
      );
    },
    Awareness.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Awareness(),
      );
    },
    Records.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Records(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i3.RouteConfig(
          Signup.name,
          path: '/signup',
        ),
        _i3.RouteConfig(
          Welcome.name,
          path: '/welcome',
        ),
        _i3.RouteConfig(
          Home.name,
          path: '/home',
          guards: [authGuard],
          children: [
            _i3.RouteConfig(
              Intellibra.name,
              path: 'intellibra',
              parent: Home.name,
            ),
            _i3.RouteConfig(
              SelfCheck.name,
              path: 'selfcheck',
              parent: Home.name,
            ),
            _i3.RouteConfig(
              Awareness.name,
              path: 'awareness',
              parent: Home.name,
            ),
            _i3.RouteConfig(
              Records.name,
              path: 'records',
              parent: Home.name,
            ),
          ],
        ),
        _i3.RouteConfig(
          AwarenessDetail.name,
          path: 'awareness_detail',
        ),
      ];
}

/// generated route for
/// [_i1.Login]
class Login extends _i3.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i1.Signup]
class Signup extends _i3.PageRouteInfo<void> {
  const Signup()
      : super(
          Signup.name,
          path: '/signup',
        );

  static const String name = 'Signup';
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i3.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/welcome',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i1.Home]
class Home extends _i3.PageRouteInfo<void> {
  const Home({List<_i3.PageRouteInfo>? children})
      : super(
          Home.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i2.AwarenessDetail]
class AwarenessDetail extends _i3.PageRouteInfo<AwarenessDetailArgs> {
  AwarenessDetail({required _i6.PostModel post})
      : super(
          AwarenessDetail.name,
          path: 'awareness_detail',
          args: AwarenessDetailArgs(post: post),
        );

  static const String name = 'AwarenessDetail';
}

class AwarenessDetailArgs {
  const AwarenessDetailArgs({required this.post});

  final _i6.PostModel post;

  @override
  String toString() {
    return 'AwarenessDetailArgs{post: $post}';
  }
}

/// generated route for
/// [_i1.Intellibra]
class Intellibra extends _i3.PageRouteInfo<void> {
  const Intellibra()
      : super(
          Intellibra.name,
          path: 'intellibra',
        );

  static const String name = 'Intellibra';
}

/// generated route for
/// [_i1.SelfCheck]
class SelfCheck extends _i3.PageRouteInfo<void> {
  const SelfCheck()
      : super(
          SelfCheck.name,
          path: 'selfcheck',
        );

  static const String name = 'SelfCheck';
}

/// generated route for
/// [_i1.Awareness]
class Awareness extends _i3.PageRouteInfo<void> {
  const Awareness()
      : super(
          Awareness.name,
          path: 'awareness',
        );

  static const String name = 'Awareness';
}

/// generated route for
/// [_i1.Records]
class Records extends _i3.PageRouteInfo<void> {
  const Records()
      : super(
          Records.name,
          path: 'records',
        );

  static const String name = 'Records';
}
