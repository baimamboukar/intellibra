import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';

Future<List<ArticleModel>> mockArticles = Future.delayed(
  const Duration(seconds: 2),
  () => List<ArticleModel>.generate(
    10,
    (index) => ArticleModel(
      id: 'id$index',
      title: 'Title $index',
      content: 'Content $index',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'Description $index',
      /* topics: [
        AwarenessTopic(
            id: 'topicId$index',
            name: 'Topic Name $index',
            description: 'Topic Description $index'),
      ], */
      authorId: 'authorId$index',
      authorName: 'Author Name $index',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ),
);
