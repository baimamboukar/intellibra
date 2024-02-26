import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference _articlesCollection =
      FirebaseFirestore.instance.collection('awareness');

  Future<void> addArticle(ArticleModel article) async {
    await _articlesCollection.add(article.toJson());
  }

  Future<List<ArticleModel>> getAllArticlesPagination(int limit) async {
    final request = await _articlesCollection.limit(limit).get();
    return request.docs
        .map(
          ArticleModel.fromFirestore,
        )
        .toList();
  }

  // Other Firebase methods...
}
