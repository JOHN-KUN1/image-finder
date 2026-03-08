import 'package:get_it/get_it.dart';
import 'package:image_finder/services/navigator_service.dart';

final getIt = GetIt.instance;

void setUpLocator(){
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}