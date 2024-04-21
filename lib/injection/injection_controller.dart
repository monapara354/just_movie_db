import 'package:get/get.dart';
import 'package:just_movie/features/home/presentation/controller/home_controller.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';

class InjectionController {
  InjectionController.inject() {
    Get
      ..put(
        HomeController(
          getMovieListUC: Get.find(),
          getTrendingListUC: Get.find(),
        ),
        permanent: true,
      )
      ..lazyPut<MovieDetailController>(
        () => MovieDetailController(
          getMovieDetailUC: Get.find(),
        ),
        fenix: true,
      );
  }
}
