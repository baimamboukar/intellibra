import 'package:auto_route/auto_route.dart';
import 'package:intellibra/src/features/auth/presentation/signup/screens/signup.dart';
import 'package:intellibra/src/features/awareness/screens/awareness.dart';
import 'package:intellibra/src/features/onboarding/onboarding.dart';
import 'package:intellibra/src/features/records/medical_records.dart';
import 'package:intellibra/src/features/scan/home.dart';
import 'package:intellibra/src/features/scan/screening.dart';
import 'package:intellibra/src/features/scan/self_exam.dart';
import 'package:intellibra/src/features/settings/settings.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: Welcome,
      initial: true,
      path: '/welcome',
    ),
    AutoRoute(
      page: CreateAccount,
      initial: true,
      path: '/create-account',
    ),
    AutoRoute(
      page: ChooseLanguage,
      path: '/choose-language',
    ),
    AutoRoute(
      page: ChooseTheme,
      path: '/choose-theme',
    ),
    AutoRoute(
      page: ScreeningPage,
      path: '/screening',
    ),
    AutoRoute(
      page: Home,
      path: '/home',
      children: [
        AutoRoute(
          page: SelfCheck,
          path: 'self-check',
        ),
        AutoRoute(
          page: Awareness,
          path: 'awareness',
        ),
        AutoRoute(
          page: IntelliRecords,
          path: 'medical-records',
        ),
        AutoRoute(
          page: Settings,
          path: 'settings',
        ),
      ],
    ),
  ],
)
class $IntellibraRouter {}
