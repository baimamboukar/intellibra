part of 'awareness_cubit.dart';

@freezed
class AwarenessState with _$AwarenessState {
  const factory AwarenessState.initial() = _Initial;
  const factory AwarenessState.loading() = _Loading;
  const factory AwarenessState.loaded(List<ArticleModel> articles) = _Loaded;
  const factory AwarenessState.error(String message) = _Error;
  const factory AwarenessState.noInternet() = _NoInternet;
  
}
