import 'dart:developer';
import 'package:dio/dio.dart';
class ApiService {
  final Dio dio;
  const ApiService({required this.dio});

  Future<String> getInsights(String description, String imgPath) async {
    try {
      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent",
        data: {
          "contents": [
            {
              "parts": [
                {
                  "inline_data": {
                  "mime_type":"image/jpeg",
                  "data": imgPath
                  }
                },
                {
                  "text": "does this image have something similar to this description: $description",
                },
              ],
            },
          ],
          "systemInstruction": {
            "parts": [
              {
                "text":
                    "You are to respond with either a yes or no",
              },
            ],
          },
        },
      );
      final data = response.data;
      final aiResponse = data['candidates'][0]['content']['parts'][0]['text'];
      return aiResponse;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }


}
