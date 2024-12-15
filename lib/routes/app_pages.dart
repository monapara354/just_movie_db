import 'package:get/get.dart';
import 'package:just_movie/features/home/presentation/pages/home_screen.dart';
import 'package:just_movie/features/movie_details/presentation/pages/movie_detail_screen.dart';
import 'package:just_movie/features/movie_details/presentation/pages/person_detail_screen.dart';
import 'package:just_movie/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pageList = [
    GetPage(name: AppRoutes.initialRoute, page: HomeScreen.new),
    GetPage(name: AppRoutes.movieDetailRoute, page: MovieDetailScreen.new),
    GetPage(name: AppRoutes.personDetailRoute, page: PersonDetailScreen.new),
  ];
}
