import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/features/onboarding/thememode/cubit/theme_cubit.dart';

///TODO: #32 Redesign welcome page to give a new feel
///TODO: #33 add onboarding slider on welcome page
@RoutePage()    
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      context.scheme.primary.withOpacity(.7),
                      context.scheme.primary.withOpacity(.2),
                    ],
                  ),
                  // image: const DecorationImage(
                  //   image: AssetImage(Assets.assetsIconsAppIcon),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        context.scheme.primary.withOpacity(.7),
                        context.scheme.primary.withOpacity(.8),
                        context.scheme.primary.withOpacity(.9),
                        context.scheme.primary.withOpacity(1),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Intellibra',
                        style: context.theme.textTheme.displaySmall!.copyWith(
                          color: context.scheme.onPrimary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: Text(
                          'Scan hoha',
                          style: context.theme.textTheme.bodyMedium!.copyWith(
                            color: context.scheme.onBackground,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IntellibraButton(
                        text: 'Take to Akila',
                        color: context.scheme.primary,
                        action: () {
                          context.router.pushNamed('/home');
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.pushNamed('/create-account');
                        },
                        // icon: const Icon(Icons.add),
                        child: Text(
                          'Sign Up',
                          style:
                              context.theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14,
                            color: context.scheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
