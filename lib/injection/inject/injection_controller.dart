import 'package:get/get.dart';
import 'package:just_movie/features/home/presentation/controller/home_controller.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';

class InjectionController {
  InjectionController.inject() {
    Get
      ..lazyPut(
        () => HomeController(
          getMovieListUC: Get.find(),
          getTrendingListUC: Get.find(),
          getTrendingTVListUC: Get.find(),
          getTvListUC: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut<MovieDetailController>(
        () => MovieDetailController(
          getMovieDetailUC: Get.find(),
          getCastDetailUC: Get.find(),
          getPersonDetailUC: Get.find(),
          getPersonMoviesUC: Get.find(),
          getTVDetailUC: Get.find(),
          getPersonTvShowUC: Get.find(),
        ),
        fenix: true,
      );
  }
}
