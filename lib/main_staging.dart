import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/bootstrap.dart';
import 'package:intellibra/src/app/app.dart';
import 'package:intellibra/src/features/onboarding/thememode/cubit/theme_cubit.dart';

void main() {
  bootstrap(
    () => BlocProvider(
      create: (context) => ThemeCubit(),
      child: const Intellibra(),
    ),
  );
}
