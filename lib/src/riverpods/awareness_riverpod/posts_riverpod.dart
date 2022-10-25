import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellibra/src/models/post_model.dart';
import 'package:intellibra/src/notifier/posts_notifier.dart';

final postsRiverpod =
    StateNotifierProvider<PostsNotifier, List<PostModel>>((ref) {
  return PostsNotifier();
});
