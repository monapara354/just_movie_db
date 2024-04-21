import 'package:get/get.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';

class InjectionUseCases {
  InjectionUseCases.inject() {
    Get
      ..lazyPut<GetMovieListUC>(
        () => GetMovieListUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetTrendingListUC>(
        () => GetTrendingListUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetMovieDetailUC>(
        () => GetMovieDetailUC(movieDetailRepository: Get.find()),
        fenix: true,
      );
  }
}
