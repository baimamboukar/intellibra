import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_model.dart';
import 'package:intellibra/src/features/awareness/domain/awareness_repository.dart';

part 'awareness_state.dart';
part 'awareness_cubit.freezed.dart';

class AwarenessCubit extends Cubit<AwarenessState> {
  AwarenessCubit(this._repository) : super(const AwarenessState.initial());
  final AwarenessRepository _repository;

  Future<void> getAllArticles(int page) async {
    emit(const AwarenessState.loading());
    try {
      final articles = await _repository.getAllArticlesPagination(10, page);
      emit(AwarenessState.loaded(articles));
    } catch (e) {
      emit(AwarenessState.error(e.toString()));
    }
  }

  Future<void> likeArticle(String userId, String articleId) async {
    try {
      final isLiked = await _repository.likeArticle(userId, articleId);
      if (isLiked) {
        emit(const AwarenessState.loading());
        await getAllArticles(1);
      }
    } catch (e) {
      emit(AwarenessState.error(e.toString()));
    }
  }

  Future<void> bookMarkArticle(String userId, String articleId) async {
    try {
      await _repository.bookMarkArticle(userId, articleId);
    } catch (e) {
      emit(AwarenessState.error(e.toString()));
    }
  }

  Future<void> getBookMarkedArticles(String userId) async {
 /*    emit(const AwarenessState.loading());
    try {
      final articles = await _repository.getBookMarkedArticles(userId);
      emit(AwarenessState.loaded(articles));
    } catch (e) {
      emit(AwarenessState.error(e.toString()));
    } */
  }

  Future<void> searchArticles(String query) async {
    emit(const AwarenessState.loading());
    try {
      final articles = await _repository.searchArticle(query);
      emit(AwarenessState.loaded(articles));
    } catch (e) {
      emit(AwarenessState.error(e.toString()));
    }
  }
/* 
  @override
  AwarenessState fromJson(Map<String, dynamic> json) =>
      json['value'] as AwarenessState;

  @override
  Map<String, AwarenessState> toJson(AwarenessState state) => {'value': state}; */
}
