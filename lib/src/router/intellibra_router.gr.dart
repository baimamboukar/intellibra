// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:intellibra/src/features/auth/presentation/signup/screens/signup.dart'
    as _i7;
import 'package:intellibra/src/features/awareness/screens/awareness.dart'
    as _i3;
import 'package:intellibra/src/features/onboarding/language/choose_language.dart'
    as _i5;
import 'package:intellibra/src/features/onboarding/thememode/choose_theme.dart'
    as _i6;
import 'package:intellibra/src/features/onboarding/welcome/welcome.dart'
    as _i14;
import 'package:intellibra/src/features/records/medical_records.dart' as _i10;
import 'package:intellibra/src/features/scan/home.dart' as _i9;
import 'package:intellibra/src/features/scan/screening.dart' as _i11;
import 'package:intellibra/src/features/scan/self_exam.dart' as _i12;
import 'package:intellibra/src/features/settings/account_settings.dart' as _i1;
import 'package:intellibra/src/features/settings/app_settings.dart' as _i2;
import 'package:intellibra/src/features/settings/billing_settings.dart' as _i4;
import 'package:intellibra/src/features/settings/edit_profile.dart' as _i8;
import 'package:intellibra/src/features/settings/settings.dart' as _i13;

abstract class $IntellibraRouter extends _i15.RootStackRouter {
  $IntellibraRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AccountSettings.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountSettings(),
      );
    },
    AppSettings.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppSettings(),
      );
    },
    Awareness.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Awareness(),
      );
    },
    BillingSettings.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BillingSettings(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChooseTheme(),
      );
    },
    CreateAccount.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccount(),
      );
    },
    EditProfile.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EditProfile(),
      );
    },
    Home.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Home(),
      );
    },
    IntelliRecords.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.IntelliRecords(),
      );
    },
    RouteingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ScreeningPage(),
      );
    },
    SelfCheck.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SelfCheck(),
      );
    },
    Settings.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.Settings(),
      );
    },
    Welcome.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Welcome(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountSettings]
class AccountSettings extends _i15.PageRouteInfo<void> {
  const AccountSettings({List<_i15.PageRouteInfo>? children})
      : super(
          AccountSettings.name,
          initialChildren: children,
        );

  static const String name = 'AccountSettings';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppSettings]
class AppSettings extends _i15.PageRouteInfo<void> {
  const AppSettings({List<_i15.PageRouteInfo>? children})
      : super(
          AppSettings.name,
          initialChildren: children,
        );

  static const String name = 'AppSettings';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Awareness]
class Awareness extends _i15.PageRouteInfo<void> {
  const Awareness({List<_i15.PageRouteInfo>? children})
      : super(
          Awareness.name,
          initialChildren: children,
        );

  static const String name = 'Awareness';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BillingSettings]
class BillingSettings extends _i15.PageRouteInfo<void> {
  const BillingSettings({List<_i15.PageRouteInfo>? children})
      : super(
          BillingSettings.name,
          initialChildren: children,
        );

  static const String name = 'BillingSettings';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChooseLanguage]
class ChooseLanguage extends _i15.PageRouteInfo<void> {
  const ChooseLanguage({List<_i15.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChooseTheme]
class ChooseTheme extends _i15.PageRouteInfo<void> {
  const ChooseTheme({List<_i15.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreateAccount]
class CreateAccount extends _i15.PageRouteInfo<void> {
  const CreateAccount({List<_i15.PageRouteInfo>? children})
      : super(
          CreateAccount.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccount';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EditProfile]
class EditProfile extends _i15.PageRouteInfo<void> {
  const EditProfile({List<_i15.PageRouteInfo>? children})
      : super(
          EditProfile.name,
          initialChildren: children,
        );

  static const String name = 'EditProfile';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Home]
class Home extends _i15.PageRouteInfo<void> {
  const Home({List<_i15.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.IntelliRecords]
class IntelliRecords extends _i15.PageRouteInfo<void> {
  const IntelliRecords({List<_i15.PageRouteInfo>? children})
      : super(
          IntelliRecords.name,
          initialChildren: children,
        );

  static const String name = 'IntelliRecords';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ScreeningPage]
class RouteingRoute extends _i15.PageRouteInfo<void> {
  const RouteingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RouteingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SelfCheck]
class SelfCheck extends _i15.PageRouteInfo<void> {
  const SelfCheck({List<_i15.PageRouteInfo>? children})
      : super(
          SelfCheck.name,
          initialChildren: children,
        );

  static const String name = 'SelfCheck';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.Settings]
class Settings extends _i15.PageRouteInfo<void> {
  const Settings({List<_i15.PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Welcome]
class Welcome extends _i15.PageRouteInfo<void> {
  const Welcome({List<_i15.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
