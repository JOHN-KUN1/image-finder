part of 'album_searched_cubit.dart';

@freezed
sealed class AlbumSearchedState with _$AlbumSearchedState {
  const factory AlbumSearchedState({
    required bool searchStarted,
    required String albumName
  }) = _AlbumSearchedState;
  factory AlbumSearchedState.initial(){
    return AlbumSearchedState(searchStarted: false, albumName: '');
  }
}
