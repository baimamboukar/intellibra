// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';

@RoutePage()
class Article extends StatelessWidget {
  const Article({
    required this.article,
    super.key,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('article ${article.title}'),
      ),
    );
  }
}
