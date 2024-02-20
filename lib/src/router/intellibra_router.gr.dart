// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:intellibra/src/features/auth/presentation/signup/screens/signup.dart'
    as _i4;
import 'package:intellibra/src/features/awareness/screens/awareness.dart'
    as _i1;
import 'package:intellibra/src/features/onboarding/language/choose_language.dart'
    as _i2;
import 'package:intellibra/src/features/onboarding/thememode/choose_theme.dart'
    as _i3;
import 'package:intellibra/src/features/onboarding/welcome/welcome.dart' as _i9;
import 'package:intellibra/src/features/records/medical_records.dart' as _i6;
import 'package:intellibra/src/features/scan/home.dart' as _i5;
import 'package:intellibra/src/features/scan/self_exam.dart' as _i7;
import 'package:intellibra/src/features/settings/settings.dart' as _i8;

abstract class $IntellibraRouter extends _i10.RootStackRouter {
  $IntellibraRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Awareness.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Awareness(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChooseTheme(),
      );
    },
    CreateAccount.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateAccount(),
      );
    },
    Home.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Home(),
      );
    },
    IntelliRecords.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.IntelliRecords(),
      );
    },
    SelfCheck.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelfCheck(),
      );
    },
    Settings.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Settings(),
      );
    },
    Welcome.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Welcome(),
      );
    },
  };
}

/// generated route for
/// [_i1.Awareness]
class Awareness extends _i10.PageRouteInfo<void> {
  const Awareness({List<_i10.PageRouteInfo>? children})
      : super(
          Awareness.name,
          initialChildren: children,
        );

  static const String name = 'Awareness';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChooseLanguage]
class ChooseLanguage extends _i10.PageRouteInfo<void> {
  const ChooseLanguage({List<_i10.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChooseTheme]
class ChooseTheme extends _i10.PageRouteInfo<void> {
  const ChooseTheme({List<_i10.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreateAccount]
class CreateAccount extends _i10.PageRouteInfo<void> {
  const CreateAccount({List<_i10.PageRouteInfo>? children})
      : super(
          CreateAccount.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccount';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Home]
class Home extends _i10.PageRouteInfo<void> {
  const Home({List<_i10.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.IntelliRecords]
class IntelliRecords extends _i10.PageRouteInfo<void> {
  const IntelliRecords({List<_i10.PageRouteInfo>? children})
      : super(
          IntelliRecords.name,
          initialChildren: children,
        );

  static const String name = 'IntelliRecords';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SelfCheck]
class SelfCheck extends _i10.PageRouteInfo<void> {
  const SelfCheck({List<_i10.PageRouteInfo>? children})
      : super(
          SelfCheck.name,
          initialChildren: children,
        );

  static const String name = 'SelfCheck';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Settings]
class Settings extends _i10.PageRouteInfo<void> {
  const Settings({List<_i10.PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Welcome]
class Welcome extends _i10.PageRouteInfo<void> {
  const Welcome({List<_i10.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
