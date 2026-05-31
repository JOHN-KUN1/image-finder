part of 'found_images_cubit.dart';

@freezed
sealed class FoundImagesState with _$FoundImagesState{
  const factory FoundImagesState({
    required List<Medium> images 
  }) = _FoundImagesState;

  factory FoundImagesState.initial(){
    return FoundImagesState(images: []);
  }
}