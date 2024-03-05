// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i17;
import 'package:intellibra/src/features/auth/presentation/signup/screens/signup.dart'
    as _i8;
import 'package:intellibra/src/features/awareness/domain/awareness_model.dart'
    as _i16;
import 'package:intellibra/src/features/awareness/presentation/screens/article.dart'
    as _i3;
import 'package:intellibra/src/features/awareness/presentation/screens/awareness.dart'
    as _i4;
import 'package:intellibra/src/features/onboarding/language/choose_language.dart'
    as _i6;
import 'package:intellibra/src/features/onboarding/thememode/choose_theme.dart'
    as _i7;
import 'package:intellibra/src/features/onboarding/welcome/welcome.dart'
    as _i14;
import 'package:intellibra/src/features/records/medical_records.dart' as _i11;
import 'package:intellibra/src/features/scan/home.dart' as _i10;
import 'package:intellibra/src/features/scan/self_exam.dart' as _i12;
import 'package:intellibra/src/features/settings/account_settings.dart' as _i1;
import 'package:intellibra/src/features/settings/app_settings.dart' as _i2;
import 'package:intellibra/src/features/settings/billing_settings.dart' as _i5;
import 'package:intellibra/src/features/settings/edit_profile.dart' as _i9;
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
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ArticlePage(
          article: args.article,
          key: args.key,
        ),
      );
    },
    Awareness.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Awareness(),
      );
    },
    BillingSettings.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.BillingSettings(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ChooseTheme(),
      );
    },
    CreateAccount.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CreateAccount(),
      );
    },
    EditProfile.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EditProfile(),
      );
    },
    Home.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Home(),
      );
    },
    IntelliRecords.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.IntelliRecords(),
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
/// [_i3.ArticlePage]
class ArticleRoute extends _i15.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required _i16.ArticleModel article,
    _i17.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ArticleRoute.name,
          args: ArticleRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleRoute';

  static const _i15.PageInfo<ArticleRouteArgs> page =
      _i15.PageInfo<ArticleRouteArgs>(name);
}

class ArticleRouteArgs {
  const ArticleRouteArgs({
    required this.article,
    this.key,
  });

  final _i16.ArticleModel article;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i4.Awareness]
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
/// [_i5.BillingSettings]
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
/// [_i6.ChooseLanguage]
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
/// [_i7.ChooseTheme]
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
/// [_i8.CreateAccount]
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
/// [_i9.EditProfile]
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
/// [_i10.Home]
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
/// [_i11.IntelliRecords]
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
