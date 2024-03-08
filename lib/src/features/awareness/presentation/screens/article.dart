// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/configs/intellibra_constants.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';

import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';

import 'package:intellibra/src/common/widgets/toast.dart';

@RoutePage()
class ArticlePage extends StatelessWidget {
  const ArticlePage({
    required this.article,
    super.key,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    final isLargeScreen = context.mediaQuery.size.width > 760;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  if (article.imageUrl == null)
                    Image.asset(Assets.articlePlaceholder)
                  else
                    Hero(
                      tag: article.imageUrl!,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(article.imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.7,
                      ),
                    ),
                  16.vGap,
                  Hero(
                    tag: article.title,
                    child: Text(
                      article.title,
                      style: context.theme.textTheme.headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  8.vGap,
                  SingleChildScrollView(
                    child: Container(
                      width: context.mediaQuery.size.width * .8,
                      decoration: BoxDecoration(
                        color: context.scheme.onPrimary,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: isLargeScreen ? 64 : 8,
                          vertical: isLargeScreen ? 16 : 8),
                      child: Text(
                        article.content,
                        style: context.theme.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 8),
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  boxShadow: const [],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    stops: const [0.000, 0.5, 1.0], // Update the stop values
                    colors: [
                      context.theme.scaffoldBackgroundColor.withOpacity(0.1),
                      context.theme.scaffoldBackgroundColor.withOpacity(0.5),
                      context.theme.scaffoldBackgroundColor,
                    ],
                  ),
                  // color: Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        toastWarning(
                          context,
                          'You have to login to like this post',
                        );
                      },
                      icon: const Icon(
                        Icons.star_border,
                        size: Constants.iconSizeLarge,
                      ),
                    ),
                    IntellibraButton(
                      text: 'Save Post',
                      width: 0.3,
                      action: () {
                        toastWarning(
                          context,
                          'You have to login to save this post',
                        );
                      },
                      buttonRadius: 32,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        toastWarning(
                          context,
                          'Not yet deployed to be share',
                        );
                      },
                      icon: const Icon(
                        Icons.ios_share,
                        weight: 0.01,
                        size: Constants.iconSizeLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
