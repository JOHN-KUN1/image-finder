import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_searched_state.dart';
part 'album_searched_cubit.freezed.dart';

class AlbumSearchedCubit extends Cubit<AlbumSearchedState> {
  AlbumSearchedCubit() : super(AlbumSearchedState.initial());

  void setSearchStarted(String albumName){
      emit(state.copyWith(albumName: albumName, searchStarted: true));
    }

  void resetAlbumSearch(){
    emit(AlbumSearchedState.initial());
  }
}
