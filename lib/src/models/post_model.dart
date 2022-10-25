// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostModel {
  final String id;
  final String title;
  final String subTitle;
  final String authorName;
  final DateTime publishedDate;
  final String? coverImage;
  final String content;
  final List<String> keywords;
  PostModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.authorName,
    required this.publishedDate,
    this.coverImage,
    required this.content,
    required this.keywords,
  });

  PostModel copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? authorName,
    DateTime? publishedDate,
    String? coverImage,
    String? content,
    List<String>? keywords,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      authorName: authorName ?? this.authorName,
      publishedDate: publishedDate ?? this.publishedDate,
      coverImage: coverImage ?? this.coverImage,
      content: content ?? this.content,
      keywords: keywords ?? this.keywords,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'authorName': authorName,
      'publishedDate': publishedDate.millisecondsSinceEpoch,
      'coverImage': coverImage,
      'content': content,
      'keywords': keywords,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      authorName: map['authorName'] as String,
      publishedDate: DateTime.fromMillisecondsSinceEpoch(map['publishedDate'] as int),
      coverImage: map['coverImage'] != null ? map['coverImage'] as String : null,
      content: map['content'] as String,
      keywords: List<String>.from((map['keywords'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, subTitle: $subTitle, authorName: $authorName, publishedDate: $publishedDate, coverImage: $coverImage, content: $content, keywords: $keywords)';
  }

 
}
