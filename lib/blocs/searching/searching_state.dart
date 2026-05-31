part of 'searching_cubit.dart';

@freezed
sealed class SearchingState with _$SearchingState{
  const factory SearchingState({
    required bool isSearching
  }) = _SearchingState;

  factory SearchingState.initial(){
    return SearchingState(isSearching: false);
  }
}
