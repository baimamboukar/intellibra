
import 'package:freezed_annotation/freezed_annotation.dart';

part 'awareness_model.g.dart';
part 'awareness_model.freezed.dart';

@freezed
class AwarenessTopic with _$AwarenessTopic{
  
const factory  AwarenessTopic({required String id, required String name, required  String description}) = _AwarenessTopic;  
 factory AwarenessTopic.fromJson(Map<String, dynamic> json) => _$AwarenessTopicFromJson(json);
}

@freezed
class Article with _$Article{
const factory  Article({
    required String id,
    required  String title,
    required String content,
    required List<AwarenessTopic> topics,
    required String authorId,
    required String authorName,
    required DateTime createdAt,
    required DateTime updatedAt,
  })= _Article;

factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}
