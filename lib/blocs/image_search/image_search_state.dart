part of 'image_search_cubit.dart';

enum ImageSearchStatus{
  initial,
  loading,
  success,
  failure
}

@freezed
sealed class ImageSearchState with _$ImageSearchState{
  const factory ImageSearchState({
    required ImageSearchStatus status,
    required List<Medium> foundImages,
    required int processedCount,
    required String errorMessage,
  }) = _ImageSearchState;

  factory ImageSearchState.initial(){
    return ImageSearchState(status: ImageSearchStatus.initial, foundImages: [], processedCount: 0, errorMessage: '');
  }
}
