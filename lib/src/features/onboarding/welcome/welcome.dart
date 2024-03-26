import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/common/widgets/intellibra_button.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/onboarding/welcome/data/local_data.dart';
import 'package:onboarding/onboarding.dart';

///TODO: #32 Redesign welcome page to give a new feel
///TODO: #33 add onboarding slider on welcome page
@RoutePage()
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        buildHeader: (
          context,
          netDragDistance,
          pagesLength,
          currentIndex,
          setPageIndex,
          slideDirection,
        ) =>
            Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
              child: Text(
                'Skip',
                style: context.theme.textTheme.bodyMedium!
                    .copyWith(color: Palette.primary),
              ),
              onPressed: () {
                context.router.replaceNamed('/');
              },
            ),
          ),
        ),
        animationInMilliseconds: 1000,
        swipeableBody: onboardingData
            .map(
              (o) => SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      image: AssetImage(o.image),
                      fit: BoxFit.cover,
                    ),
                    4.vGap,
                    Text(
                      o.title,
                      style: context.theme.textTheme.displaySmall!.copyWith(
                        color: Palette.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    8.vGap,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        o.description,
                        style: context.bodyLg.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Palette.secondaryTextColor
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    64.vGap,
                  ],
                ),
              ),
            )
            .toList(), //[List<Widget>] - List of swipeable widgets

        onPageChanges:
            (netDragDistance, pagesLength, currentIndex, slideDirection) {
          //1) [pagesLength] The drage distance from swipping
          //2) [pagesLength] The length of the swipeable widgets
          //3) [currentIndex] The currect index
          //4) [slideDirection] The slide direction
        },
        buildFooter: (
          context,
          netDragDistance,
          pagesLength,
          currentIndex,
          setIndex,
          slideDirection,
        ) =>
            Padding(
          padding: const EdgeInsets.all(16),
          child: IntellibraFlexibleButton(
            action: () => currentIndex >= 4
                ? context.router.replaceNamed('/')
                : setIndex(currentIndex + 1),
            text: currentIndex >= 4 ? 'Get started' : 'Next',
          ),
        ), //[Widget] - The footer widget
      ),
    );
  }
}

/* 
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
 */
