import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_finder/services/api_service.dart';
import 'package:image_finder/services/navigator_service.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      dio: Dio(
        BaseOptions(
          method: "POST",
          headers: {
            //"x-goog-api-key": dotenv.env['API_KEY'] as String,
            //"Authorization": "Bearer ${dotenv.env['API_KEY'] as String}"
            "Authorization": "Bearer ${dotenv.env['NV_API_KEY'] as String}",
            "Accept": "application/json",
          },
          contentType: "application/json",
        ),
      ),
    ),
  );
}
