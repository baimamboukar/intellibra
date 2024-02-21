import 'package:auto_route/auto_route.dart';

import 'package:intellibra/src/router/intellibra_router.gr.dart';

@AutoRouterConfig()
class IntellibraRouter extends $IntellibraRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: Welcome.page,
          initial: true,
          path: '/welcome',
        ),
        AutoRoute(
          page: CreateAccount.page,
          path: '/create-account',
        ),
        AutoRoute(
          page: ChooseLanguage.page,
          path: '/choose-language',
        ),
        AutoRoute(
          page: ChooseTheme.page,
          path: '/choose-theme',
        ),
       
        AutoRoute(
          page: AccountSettings.page,
          path: '/account-settings',
        ), 
        AutoRoute(
          page: AppSettings.page,
          path: '/app-settings',
        ), 
        AutoRoute(
          page: BillingSettings.page,
          path: '/billing-settings',
        ), 
        AutoRoute(
          page: EditProfile.page,
          path: '/billing-settings',
        ), 
        
        

        AutoRoute(
          page: Home.page,
          path: '/home',
          children: [
            AutoRoute(
              page: SelfCheck.page,
              path: 'self-check',
            ),
            AutoRoute(
              page: Awareness.page,
              path: 'awareness',
            ),
            AutoRoute(
              page: IntelliRecords.page,
              path: 'medical-records',
            ),
            AutoRoute(
              page: Settings.page,
              path: 'settings',
            ),
          ],
        ),
      ];
}
