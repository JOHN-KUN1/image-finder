import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'has_searched_state.dart';
part 'has_searched_cubit.freezed.dart';

class HasSearchedCubit extends Cubit<HasSearchedState> {
  HasSearchedCubit() : super(HasSearchedState.initial());

  void setHasSearched(bool value){
    emit(state.copyWith(hasSearched: value));
  }
}
