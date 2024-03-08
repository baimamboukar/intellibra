
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';
import 'package:intellibra/src/features/awareness/presentation/widgets/article_card.dart';
import 'package:intellibra/src/router/intellibra_router.gr.dart';

class ArticlesMobileView extends StatelessWidget {
  const ArticlesMobileView({
    required this.articles,
    super.key,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        final article = articles[i];
        return GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(ArticleRoute(article: article));
          },
          child: ArticleCard(
            id: article.id,
            title: article.title,
            createdAt: article.createdAt,
            description: article.description,
            authorName: article.authorName,
            image: article.imageUrl,
          ),
        );
      },
      separatorBuilder: (context, i) => 32.vGap,
      itemCount: articles.length,
    );
  }
}
