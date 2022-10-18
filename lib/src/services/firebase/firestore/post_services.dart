// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellibra/src/models/post_model.dart';
import 'package:intellibra/src/riverpods/storage_riverpod.dart';

class PostServices {
  final Reader _read;
  PostServices(
    this._read,
  );
  final _firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> getAllPosts(List<PostModel> fakePosts) async {
    List<PostModel> posts = [];
    try {
      posts.map((post) async {
        if (post.coverImage != null) {
          final image =
              await _read(storageProvider).getImageLink(post.coverImage!);
          final newPost = post.copyWith(coverImage: image);
          posts.add(newPost);
        } else {
          posts.add(post);
        }
      });
    } on FirebaseException catch(e) {
      SnackBar(
        content: Text("the code is ${e.code} and message: ${e.message}"),
      );
    }
    return posts;
  }
}
