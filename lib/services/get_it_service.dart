import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:image_finder/services/api_service.dart';
import 'package:image_finder/services/cache_service.dart';
import 'package:image_finder/services/navigator_service.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<CacheService>(() => CacheService());
  getIt.registerLazySingleton<ApiService>(() {
    final apiKey = dotenv.env['NV_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw StateError('NV_API_KEY is missing from the .env file.');
    }

    return ApiService(
      dio: Dio(
        BaseOptions(
          method: 'POST',
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Accept': 'application/json',
          },
          contentType: 'application/json',
        ),
      ),
    );
  });
}
