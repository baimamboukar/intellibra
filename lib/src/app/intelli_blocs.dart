import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/src/features/onboarding/thememode/cubit/theme_cubit.dart';

class IntelliBlocs extends StatelessWidget {
  const IntelliBlocs({
    required this.child, super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: child,
    );
  }
}
