import 'package:intellibra/src/configs/intellibra_constants.dart';
import 'package:intellibra/src/features/awareness/data/local_datasource.dart';
import 'package:intellibra/src/features/awareness/data/mock_datasource.dart';
import 'package:intellibra/src/features/awareness/data/remote_datasouce.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class AwarenessRepository {
  final FirebaseService _firebaseService = FirebaseService();
  final HiveService _hiveService = HiveService();

  Future<void> addArticle(ArticleModel article) async {
    // Check internet connectivity
    final isConnected = await checkInternetConnectivity();

    if (isConnected) {
      await _firebaseService.addArticle(article);
    } else {
      // Handle offline storage with Hive or other local storage method
      // _hiveService.addArticleLocally(article);
    }
  }

  Future<List<ArticleModel>> getAllArticlesPagination(int limit, int page) async {
    // Check internet connectivity
    if (Constants.isMockData) {
      return mockArticles;
    }
    final isConnected = await checkInternetConnectivity();
    if (isConnected) {
      return _firebaseService.getAllArticlesPagination(limit, page);
    } else {
      return _hiveService.getAllArticlesLocally();
      // Handle offline retrieval with Hive or other local storage method
      // return _hiveService.getAllArticles();
    }
  }

  Future<bool> likeArticle(String userId, String articleId) async {
    // Check internet connectivity
    final isConnected = await checkInternetConnectivity();

    if (isConnected) {
      return _firebaseService.likeArticle(userId, articleId);
    } else {
      // Handle offline storage with Hive or other local storage method
      // _hiveService.likeArticleLocally(article);
      throw Exception('No internet connection');
    }
  }

  Future<void> bookMarkArticle(String userId, String articleId) async {
    // Check internet connectivity
    final isConnected = await checkInternetConnectivity();

    if (isConnected) {
      return _firebaseService.bookMarkArticle(userId, articleId);
    } else {
      // Handle offline storage with Hive or other local storage method
      // _hiveService.bookMarkArticleLocally(article);
      throw Exception('No internet connection');
    }
  }

  Future<List<ArticleModel>> searchArticle(String query) async {
    // Check internet connectivity
    final isConnected = await checkInternetConnectivity();

    if (isConnected) {
      return _firebaseService.searchArticle(query);
    } else {
      // Handle offline storage with Hive or other local storage method
      // return _hiveService.searchArticleLocally(query);
      throw Exception('No internet connection');
    }
  }
}

Future<bool> checkInternetConnectivity() {
  return InternetConnection().hasInternetAccess;
}
