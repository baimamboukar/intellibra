import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/l10n/l10n.dart';
import 'package:intellibra/src/app/intelli_blocs.dart';
import 'package:intellibra/src/configs/intellibra_theme.dart';
import 'package:intellibra/src/features/onboarding/thememode/cubit/theme_cubit.dart';
import 'package:intellibra/src/router/intellibra_router.dart';

class Intellibra extends StatefulWidget {
  const Intellibra({super.key});

  @override
  State<Intellibra> createState() => _IntellibraState();
}

class _IntellibraState extends State<Intellibra> {
  late IntellibraRouter router;
  @override
  void initState() {
    router = IntellibraRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntelliBlocs(
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (BuildContext context, bool state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: state == false ? ThemeMode.light : ThemeMode.dark,
            theme: IntellibraTheme.light,
            darkTheme: IntellibraTheme.dark,
            routerConfig: router.config(),
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
