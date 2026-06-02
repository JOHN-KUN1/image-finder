import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_finder/repositories/ai_repository.dart';
import 'package:photo_gallery/photo_gallery.dart';

part 'image_search_state.dart';
part 'image_search_cubit.freezed.dart';

class ImageSearchCubit extends Cubit<ImageSearchState> {
  final AiRepository aiRepository;
  ImageSearchCubit({required this.aiRepository}) : super(ImageSearchState.initial());

  Future<void> search(List<Medium> albumImages, String desc) async {
    if (desc.trim().isEmpty) return;

    emit(state.copyWith(
      status: ImageSearchStatus.loading,
      foundImages: [],
      processedCount: 0,
      errorMessage: '',
    ));

    const int batchSize = 5;
    for (int i = 0; i < albumImages.length; i += batchSize) {
      if (state.status != ImageSearchStatus.loading) return;

      final batch = albumImages.skip(i).take(batchSize).toList();

      await Future.wait(
        batch.map((image) async {
          try {
            final imageFile = await image.getFile();
            final mimeType = image.mimeType!;
            final imgPath = base64Encode(imageFile.readAsBytesSync());
            final response = await aiRepository.getInsights(desc.trim(), imgPath, mimeType);

            if (response =='yes') {
                emit(state.copyWith(foundImages: [...state.foundImages, image]));
            }
          } catch (e) {
              emit(state.copyWith(status: ImageSearchStatus.failure,errorMessage: e.toString()));
          } finally {
            emit(state.copyWith(processedCount: state.processedCount+ 1));
          }
        }),
      );

    }
    
    if (state.status == ImageSearchStatus.loading) {
      emit(state.copyWith(status: ImageSearchStatus.success));
    }
  }

  void resetSearch(){
    emit(ImageSearchState.initial());
  }
}
