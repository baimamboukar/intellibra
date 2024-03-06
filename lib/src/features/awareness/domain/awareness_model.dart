import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'awareness_model.g.dart';
part 'awareness_model.freezed.dart';

@freezed
class AwarenessTopic with _$AwarenessTopic {
  const factory AwarenessTopic(
      {required String id,
      required String name,
      required String description}) = _AwarenessTopic;
  factory AwarenessTopic.fromJson(Map<String, dynamic> json) =>
      _$AwarenessTopicFromJson(json);
}

@Freezed(
    //fromJson: false,
    )
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required String id,
    required String title,
    required String content,
     String? imageUrl,
    required String? description,
    // required List<AwarenessTopic>? topics,
    required String? authorId,
    required String authorName,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Article;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  factory ArticleModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return ArticleModel(
      id: doc.id,
      title: data['title'] as String,
      content: data['content'] as String,
      imageUrl: data['imageUrl'][0]['downloadURL'] as String,
      description: 
        data['description'] as String,
      authorId: '',
      //  data['authorId'] as String?,
      authorName: data['authorName'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }
}
