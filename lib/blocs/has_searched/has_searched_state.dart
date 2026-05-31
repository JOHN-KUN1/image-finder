part of 'has_searched_cubit.dart';

@freezed
sealed class HasSearchedState with _$HasSearchedState{
  const factory HasSearchedState({
    required bool hasSearched
  }) = _HasSearchedState;

  factory HasSearchedState.initial(){
    return HasSearchedState(hasSearched: false);
  }
}
