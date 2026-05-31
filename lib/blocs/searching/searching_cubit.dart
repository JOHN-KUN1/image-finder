import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searching_state.dart';
part 'searching_cubit.freezed.dart';

class SearchingCubit extends Cubit<SearchingState> {
  SearchingCubit() : super(SearchingState.initial());

  void setSearch(bool value){
    emit(state.copyWith(isSearching: value));
  }
}
