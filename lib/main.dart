import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/bootstrap.dart';
import 'package:intellibra/src/app/app.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_repository.dart';
import 'package:intellibra/src/features/onboarding/thememode/cubit/theme_cubit.dart';
import 'package:intellibra/src/features/scan/presentation/cubit/scan_cubit.dart';

import 'package:intellibra/src/features/awareness/presentation/cubit/awareness_cubit.dart';

void main() {
  bootstrap(
    () => MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AwarenessRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: ThemeCubit(),
          ),
          BlocProvider.value(value: ScanCubit()..checkBlueState()),
          BlocProvider(
            create: (context) => AwarenessCubit(
              context.read<AwarenessRepository>(),
            ),
          ),
        ],
        child: const Intellibra(),
      ),
    ),
  );
}
