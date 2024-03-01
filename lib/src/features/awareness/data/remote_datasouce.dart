import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference _articlesCollection =
      FirebaseFirestore.instance.collection('awareness');
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  DocumentSnapshot? _lastDocument;

  Future<void> addArticle(ArticleModel article) async {
    await _articlesCollection.add(article.toJson());
  }

  Future<List<ArticleModel>> getAllArticlesPagination(
    int limit,
    int page,
  ) async {
    var query =
        _articlesCollection.orderBy('createdAt', descending: true).limit(limit);
    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }
    final querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      _lastDocument = querySnapshot.docs.last;
    }
    return querySnapshot.docs.map(ArticleModel.fromFirestore).toList();
  }

  // Other Firebase methods...
  Future<bool> likeArticle(String userId, String articleId) async {
    final articleDoc = _articlesCollection.doc(articleId);
    final articleSnapshot = await articleDoc.get();
    final likeList =
        (articleSnapshot.data()! as Map<String, dynamic>?)!['like'] as List;

    if (!likeList.contains(userId)) {
      likeList.add(userId);
      await articleDoc.update({'like': likeList});
      return true;
    }
    return false;
  }

  Future<void> bookMarkArticle(String userId, String articleId) {
    final userDoc = _usersCollection.doc(userId);
    final bookmarkList = userDoc.collection('bookmarks');
    return bookmarkList.doc(articleId).set({'articleId': articleId});
  }

  Future<List<ArticleModel>> searchArticle(String query) {
    return _articlesCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .get()
        .then((value) => value.docs.map(ArticleModel.fromFirestore).toList());
  }

  // Other Firebase methods...
}
