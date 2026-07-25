import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  const ApiService({required this.dio});

  // Future<String> getInsights(
  //   String description,
  //   String imgPath,
  //   String mimeType,
  // ) async {
  //   try {
  //     final response = await dio.post(
  //       "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent",
  //       data: {
  //         "contents": [
  //           {
  //             "parts": [
  //               {
  //                 "inline_data": {"mime_type": mimeType, "data": imgPath},
  //               },
  //               {
  //                 "text":
  //                     "Does this image have something similar to this description: $description",
  //               },
  //             ],
  //           },
  //         ],
  //         "systemInstruction": {
  //           "parts": [
  //             {"text": "You are to respond with either a yes or no"},
  //           ],
  //         },
  //       },
  //     );
  //     final data = response.data;
  //     final aiResponse = data['candidates'][0]['content']['parts'][0]['text'];
  //     //log('airesponse: $aiResponse');
  //     return aiResponse;
  //   } catch (e) {
  //     log('ApiService error: $e');
  //     // Gracefully fail on error (caller handles 'no' safely)
  //     return 'no';
  //   }
  // }

  // Future<String> getInsights(
  //   String description,
  //   String imgPath,
  //   String mimeType,
  // ) async {
  //   try {
  //     final response = await dio.post(
  //       "https://openrouter.ai/api/v1/chat/completions",
  //       data: {
  //         "model": "google/gemma-3-4b-it:free",
  //         "messages": [
  //           // {
  //           //   "role": "system",
  //           //   "content":
  //           //       "You are an image analysis assistant. Respond with only 'yes' or 'no'.",
  //           // },
  //           {
  //             "role": "user",
  //             "content": [
  //               {
  //                 "type": "text",
  //                 "text":
  //                     "Does this image have something similar to this description: $description. Respond with only 'yes' or 'no'.",
  //               },
  //               {
  //                 "type": "image_url",
  //                 "image_url": {
  //                   "url": "data:$mimeType;base64,$imgPath",
  //                 },
  //               },
  //             ],
  //           },
  //         ],
  //         "reasoning": {"enabled": true},
  //       },
  //     );
  //     final data = response.data;
  //     final aiResponse =
  //         data['choices'][0]['message']['content'] as String;
  //     log('airesponse: $aiResponse');
  //     return aiResponse;
  //   } catch (e) {
  //     log('ApiService error: $e');
  //     // Gracefully fail on error (caller handles 'no' safely)
  //     return 'no';
  //   }
  // }

  Future<String> getInsights(
    String description,
    String imgPath,
    String mimeType,
  ) async {
    try {
      final response = await dio.post(
        "https://integrate.api.nvidia.com/v1/chat/completions",
        data: {
          "model": "google/gemma-3n-e4b-it",
          "messages": [
            {
              "role": "user",
              "content":
                  "Does this image: <img src=\"data:image/png;base64,'$imgPath'\" /> have something similar to this description: $description. Respond with only 'yes' or 'no'.",
            },
          ],
        },
      );
      final data = response.data;
      final aiResponse = data['choices'][0]['message']['content'] as String;
      return aiResponse;
    } catch (e) {
      // Gracefully fail on error (caller handles 'no' safely)
      rethrow;
    }
  }
}
