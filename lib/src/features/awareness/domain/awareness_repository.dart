import 'package:intellibra/src/configs/intellibra_constants.dart';
import 'package:intellibra/src/features/awareness/data/local_datasource.dart';
import 'package:intellibra/src/features/awareness/data/mock_datasource.dart';
import 'package:intellibra/src/features/awareness/data/remote_datasouce.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class AwarenessRepository {
  final FirebaseService _firebaseService = FirebaseService();
  final HiveService _hiveService = HiveService();

  Future<void> addArticle(Article article) async {
    // Check internet connectivity
    final isConnected = await checkInternetConnectivity();

    if (isConnected) {
      await _firebaseService.addArticle(article);
    } else {
      // Handle offline storage with Hive or other local storage method
      // _hiveService.addArticleLocally(article);
    }
  }

  Future<List<Article>> getAllArticlesPagination(int limit) async {
    // Check internet connectivity
    if(Constants.isMockData){
      return mockArticles;
    }
    final isConnected = await checkInternetConnectivity();
    if (isConnected) {
      return _firebaseService.getAllArticlesPagination(limit);
    } else {
      return _hiveService.getAllArticlesLocally();
      // Handle offline retrieval with Hive or other local storage method
      // return _hiveService.getAllArticles();
    }
  }
}

Future<bool> checkInternetConnectivity() {
  return InternetConnection().hasInternetAccess;
}
