// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';

import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';

@RoutePage()
class ArticlePage extends StatelessWidget {
  const ArticlePage({
    required this.article,
    super.key,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              if (article.imageUrl == null)
                Image.asset(Assets.articlePlaceholder)
              else
                Image.network(
                  article.imageUrl!,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  loadingBuilder: (context, child, loadingProgress) =>
                      const CircularProgressIndicator.adaptive(),
                ),
              8.vGap,
              Text(
                article.title,
                style: context.theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              8.vGap,
              Text(
                article.content,
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Palette.lightColor,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
