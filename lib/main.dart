import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_listener/hive_listener.dart';
import 'package:intellibra/src/router/guards/auth_guard.dart';
import 'package:intellibra/src/router/router.gr.dart';
import 'package:intellibra/src/utils/palette.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    name: 'intellibra',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  await Hive.openBox('userBox');

  Hive.box('userBox').isEmpty
      ? {
          Hive.box('userBox').put('language', 'English'),
          Hive.box('userBox').put('theme', false),
        }
      : null;
  runApp(
    const ProviderScope(
      child: IntelligentBra(),
    ),
  );
}

class IntelligentBra extends ConsumerStatefulWidget {
  const IntelligentBra({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntelligentBraState();
}

class _IntelligentBraState extends ConsumerState<IntelligentBra> {
  late AppRouter _appRouter;
  @override
  void initState() {
    _appRouter = AppRouter(
      authGuard: AuthGuard(
        ref: ref,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiveListener(
      box: Hive.box('userBox'),
      builder: (box) => MaterialApp.router(
        restorationScopeId: 'IntelligentBra',
        title: 'IntelligentBra',
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        color: Palette.primary,
        themeMode: box.get('theme') ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Palette.backgroundDark,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
          ),
        ),
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Palette.primary,
          buttonTheme: const ButtonThemeData(
            buttonColor: Palette.tertiary,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: MaterialColor(
              Palette.primary.value,
              const <int, Color>{
                50: Palette.primary,
                100: Palette.primary,
                200: Palette.primary,
                300: Palette.primary,
                400: Palette.primary,
                500: Palette.primary,
                600: Palette.primary,
                700: Palette.primary,
                800: Palette.primary,
                900: Palette.primary,
              },
            ),
          ).copyWith(
            secondary: Palette.secondary,
          ),
          scaffoldBackgroundColor: Palette.lightGrey,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
