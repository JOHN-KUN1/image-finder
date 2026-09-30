import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  const ApiService({required this.dio});

  Future<String> getInsights(
    String description,
    String imgPath,
    String? refImg,
    String mimeType,
  ) async {
    log('------in api');
    try {
      // Build the content array with image(s) + text in OpenAI multimodal format.
      final List<Map<String, dynamic>> contentParts = [];

      if (refImg == null) {
        contentParts.add({
          "type": "image_url",
          "image_url": {
            "url": "data:$mimeType;base64,$imgPath",
          },
        });
        contentParts.add({
          "type": "text",
          "text":
              "Does this image have something similar to this description: $description. Respond with only 'yes' or 'no'.",
        });
      } else {
        contentParts.add({
          "type": "image_url",
          "image_url": {
            "url": "data:$mimeType;base64,$refImg",
          },
        });
        contentParts.add({
          "type": "image_url",
          "image_url": {
            "url": "data:$mimeType;base64,$imgPath",
          },
        });
        contentParts.add({
          "type": "text",
          "text":
              "Using the first reference image, does the second album image look similar? Respond with only 'yes' or 'no'.",
        });
      }

      final response = await dio.post(
        "https://integrate.api.nvidia.com/v1/chat/completions",
        data: {
          "model": "nvidia/ising-calibration-1.5-31b",
          "messages": [
            {
              "role": "user",
              "content": contentParts,
            },
          ],
          "max_tokens": 32768,
          "temperature": 1.00,
          "top_p": 0.95,
          "stream": false,
        },
      );
      final data = response.data;
      final aiResponse = data['choices'][0]['message']['content'] as String;
      return aiResponse;
    } catch (e) {
      log('error: $e');
      rethrow;
    }
  }
}

