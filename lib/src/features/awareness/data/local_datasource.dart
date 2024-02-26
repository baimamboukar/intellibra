import 'dart:async';
import 'package:hive/hive.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';

class HiveService {
  static const String _articlesBoxName = 'articles';

  // Open the Hive box for articles
  Future<Box<ArticleModel>> _openArticlesBox() async {
    return Hive.openBox<ArticleModel>(_articlesBoxName);
  }

  // ignore: strict_raw_type
  Future<void> _closeBox(Box box) async {
    await box.close();
  }

  Future<void> addArticleLocally(ArticleModel article) async {
    final box = await _openArticlesBox();
    await box.add(article);
    await _closeBox(box);
  }

  Future<void> addAllArticleLocally(List<ArticleModel> articles) async {
    final box = await _openArticlesBox();
    await box.addAll(articles);
    await _closeBox(box);
  }

  Future<List<ArticleModel>> getAllArticlesLocally() async {
    final box = await _openArticlesBox();
    final result = box.values.toList();
    await _closeBox(box);
    return result;
  }

  // Other Hive methods...

  // Example Hive method to update local article
  Future<void> updateArticleLocally(ArticleModel updatedArticle) async {
    final box = await _openArticlesBox();
    final index = box.values
        .toList()
        .indexWhere((article) => article.id == updatedArticle.id);

    if (index != -1) {
      await box.putAt(index, updatedArticle);
    }
    await _closeBox(box);
  }
}
