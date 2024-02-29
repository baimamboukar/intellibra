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
/* 
  @override
  AwarenessState fromJson(Map<String, dynamic> json) =>
      json['value'] as AwarenessState;

  @override
  Map<String, AwarenessState> toJson(AwarenessState state) => {'value': state}; */
}
