import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model.dart';

class PostsNotifier extends StateNotifier<List<PostModel>> {
  PostsNotifier() : super([]);

  void addPost(PostModel post) {
    state = [...state, post];
  }

  void removePost(PostModel remove) {
    state = [
      for (final post in state)
        if (post != remove) post,
    ];
  }

  
}
