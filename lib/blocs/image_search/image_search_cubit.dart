import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_finder/repositories/ai_repository.dart';
import 'package:image_finder/services/cache_service.dart';
import 'package:photo_gallery/photo_gallery.dart';

part 'image_search_state.dart';
part 'image_search_cubit.freezed.dart';

class ImageSearchCubit extends Cubit<ImageSearchState> {
  final AiRepository aiRepository;
  final CacheService cacheService;

  ImageSearchCubit({required this.aiRepository, required this.cacheService})
      : super(ImageSearchState.initial());

  Future<void> search(List<Medium> albumImages, String desc) async {
    if (desc.trim().isEmpty) return;

    emit(state.copyWith(
      status: ImageSearchStatus.loading,
      foundImages: [],
      processedCount: 0,
      errorMessage: '',
    ));

    // Process images in larger concurrent batches for speed.
    const int batchSize = 15;

    for (int i = 0; i < albumImages.length; i += batchSize) {
      if (state.status != ImageSearchStatus.loading) return;

      final batch = albumImages.skip(i).take(batchSize).toList();

      await Future.wait(
        batch.map((image) async {
          try {
            // 1. Check the local cache first — skip the API if we have a result.
            final cached = await cacheService.get(image.id, desc);
            final String response;

            if (cached != null) {
              response = cached;
            } else {
              // 2. Use getThumbnail() instead of getFile() — much smaller payload.
              final thumbnailBytes = await image.getThumbnail(
                width: 512,
                height: 512,
                highQuality: false,
              );
              final imgPath = base64Encode(thumbnailBytes);
              // Thumbnails are always JPEG regardless of the source format.
              const mimeType = 'image/jpeg';

              response = await aiRepository.getInsights(
                  desc.trim(), imgPath, mimeType);

              // 3. Persist the result so future searches for the same query
              //    skip the network call entirely.
              await cacheService.set(image.id, desc, response);
            }

            if (response.toLowerCase().contains('yes')) {
              emit(state.copyWith(foundImages: [...state.foundImages, image]));
            }
          } catch (e) {
            emit(state.copyWith(
                status: ImageSearchStatus.failure,
                errorMessage: e.toString()));
          } finally {
            emit(state.copyWith(processedCount: state.processedCount + 1));
          }
        }),
      );
    }

    if (state.status == ImageSearchStatus.loading) {
      emit(state.copyWith(status: ImageSearchStatus.success));
    }
  }

  void resetSearch() {
    emit(ImageSearchState.initial());
  }
}
