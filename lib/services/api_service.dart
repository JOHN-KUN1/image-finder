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
    final prompt = refImg == null
        ? 'Does this image have something similar to this description: $description? Respond with only "yes" or "no".'
        : 'Using the first image as a reference, does the second image look similar? Respond with only "yes" or "no".';

    final content = <Map<String, dynamic>>[
      {'type': 'text', 'text': prompt},
    ];

    if (refImg != null) {
      content.add({
        'type': 'image_url',
        'image_url': {'url': 'data:$mimeType;base64,$refImg'},
      });
    }

    content.add({
      'type': 'image_url',
      'image_url': {'url': 'data:$mimeType;base64,$imgPath'},
    });

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
        'https://integrate.api.nvidia.com/v1/chat/completions',
        data: {
          'model': 'nvidia/nemotron-3-nano-omni-30b-a3b-reasoning',
          'messages': [
            {'role': 'user', 'content': content},
          ],
          'max_tokens': 65536,
          'reasoning_budget': 16384,
          'stream': false,
          'temperature': 0.6,
          'top_p': 0.95,
        },
      );
      return response.data['choices'][0]['message']['content'] as String;
    } catch (e) {
      log('NVIDIA API request failed: $e');
      rethrow;
    }
  }
}

