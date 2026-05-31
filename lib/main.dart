import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_finder/blocs/found_images/found_images_cubit.dart';
import 'package:image_finder/blocs/has_searched/has_searched_cubit.dart';
import 'package:image_finder/blocs/response/response_cubit.dart';
import 'package:image_finder/blocs/searching/searching_cubit.dart';
import 'package:image_finder/repositories/ai_repository.dart';
import 'package:image_finder/screens/home_screen.dart';
import 'package:image_finder/services/api_service.dart';
import 'package:image_finder/services/get_it_service.dart';
import 'package:image_finder/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  setUpLocator();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AiRepository(apiService: getIt<ApiService>()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchingCubit>(create: (context) => SearchingCubit(),),
          BlocProvider<HasSearchedCubit>(create: (context) => HasSearchedCubit(),),
          BlocProvider<FoundImagesCubit>(create: (context) => FoundImagesCubit(aiRepository: context.read<AiRepository>(), searchingCubit: context.read<SearchingCubit>()),)
        ],
        child: MaterialApp(
          navigatorKey: getIt<NavigationService>().navigatorKey,
          title: 'Image Finder',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xFF0B0D12),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF0B0D12),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFFF5A00),
              brightness: Brightness.dark,
              primary: const Color(0xFFFF5A00),
            ),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
