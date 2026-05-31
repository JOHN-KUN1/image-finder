// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:image_finder/blocs/found_images/found_images_cubit.dart';
// import 'package:image_finder/repositories/ai_repository.dart';
// import 'package:photo_gallery/photo_gallery.dart';

// part 'response_state.dart';
// part 'response_cubit.freezed.dart';

// class ResponseCubit extends Cubit<ResponseState> {
//   final FoundImagesState foundImages;
//   final AiRepository aiRepository;
//   ResponseCubit({
//     required this.aiRepository, required this.foundImages
//   }) : super(ResponseState.initial());

//   Future<void> getInsights(List<Medium> albumImages,String desc, String imgPath, String mimeType) async {
//     emit(state.copyWith(responseStatus: ResponseStatus.loading));

//     const int batchSize = 5;
//     for (int i = 0; i < albumImages.length; i += batchSize) {
//       final batch = albumImages.skip(i).take(batchSize).toList();

//       await Future.wait(
//         batch.map((image) async {
//           try {
//             final imageFile = await image.getFile();
//             final mimeType = image.mimeType!;
//             final imgPath = base64Encode(imageFile.readAsBytesSync());
//             final response = await aiRepository.getInsights(desc, imgPath, mimeType);

//             if (response =='yes') {
//                   foundImages.;
//             }
//           } catch (e) {
//             if (mounted) {
//               errorMessage = e.toString();
//             }
//             return;
//           } finally {
//             if (mounted && errorMessage.isEmpty) {
//               setState(() {
//                 processedCount++;
//                 searchProgress = processedCount / albumImages.length;
//               });
//             }
//           }
//         }),
//       );
//     }

//     if (mounted) {
//       setState(() {
//         isSearching = false;
//       });
//     }
    
//     try {

//       final aiResponse = await aiRepository.getInsights(desc, imgPath, mimeType);
//       emit(state.copyWith(responseStatus: ResponseStatus.success, response: aiResponse));
//     } catch (e) {
//       emit(state.copyWith(responseStatus: ResponseStatus.failure,error: e.toString()));
//     }
//   }
// }
