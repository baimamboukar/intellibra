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
class Article with _$Article {
  const factory Article({
    required String? id,
    required String? title,
    required String? content,
    required String? imageUrl,
    required String? description,
   // required List<AwarenessTopic>? topics,
    required String? authorId,
    required String? authorName,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  factory Article.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Article.fromJson(data).copyWith(id: doc.id);
  }
}
