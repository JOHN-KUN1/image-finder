import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_finder/blocs/searching/searching_cubit.dart';
import 'package:image_finder/repositories/ai_repository.dart';
import 'package:photo_gallery/photo_gallery.dart';

part 'found_images_cubit.freezed.dart';
part 'found_images_state.dart';

class FoundImagesCubit extends Cubit<FoundImagesState> {
  final AiRepository aiRepository;
  final SearchingCubit searchingCubit;
  FoundImagesCubit({required this.aiRepository, required this.searchingCubit}) : super(FoundImagesState.initial());

  Future<void> getInsights(List<Medium> albumImages,String desc) async {
    const int batchSize = 5;
    for (int i = 0; i < albumImages.length; i += batchSize) {
      final batch = albumImages.skip(i).take(batchSize).toList();

      await Future.wait(
        batch.map((image) async {
          try {
            final imageFile = await image.getFile();
            final mimeType = image.mimeType!;
            final imgPath = base64Encode(imageFile.readAsBytesSync());
            final response = await aiRepository.getInsights(desc, imgPath, mimeType);

            if (response =='yes') {
                emit(state.copyWith(images: [...state.images, image]));
            }
          } catch (e) {
            //emit(s)
          } finally {
            // if (mounted && errorMessage.isEmpty) {
            //   setState(() {
            //     processedCount++;
            //     searchProgress = processedCount / albumImages.length;
            //   });
            // }
          }
        }),
      );
    }
    // if (mounted) {
    //   setState(() {
    //     isSearching = false;
    //   });
    // }
    
  }
}
