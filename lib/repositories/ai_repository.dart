// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_finder/services/api_service.dart';

class AiRepository {
  final ApiService apiService;
  AiRepository({
    required this.apiService,
  });

  Future<String> getInsights(String description, String imgPath, String mimeType) async {
    try {
      final aiResponse = await apiService.getInsights(description, imgPath, mimeType);
      return aiResponse;
    } catch (e) {
      rethrow;
    }
  }
}
