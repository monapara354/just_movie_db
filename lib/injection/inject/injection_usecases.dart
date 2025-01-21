import "package:get/get.dart";
import "package:just_movie/features/home/domain/usecases/get_all_movie.dart";
import "package:just_movie/features/home/domain/usecases/get_all_tv.dart";
import "package:just_movie/features/home/domain/usecases/get_tranding.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_cast_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_person_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_tv_detail.dart";
import "package:just_movie/features/search/domain/usecases/search_movie.dart";

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
      ..lazyPut<GetTrendingTVListUC>(
        () => GetTrendingTVListUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetTvListUC>(
        () => GetTvListUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetMovieDetailUC>(
        () => GetMovieDetailUC(movieDetailRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetCastDetailUC>(
        () => GetCastDetailUC(movieDetailRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetPersonDetailUC>(
        () => GetPersonDetailUC(movieDetailRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetPersonMoviesUC>(
        () => GetPersonMoviesUC(movieDetailRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetTVDetailUC>(
        () => GetTVDetailUC(movieDetailRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<GetPersonTvShowUC>(
        () => GetPersonTvShowUC(movieDetailRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<SearchMovieListUC>(
        () => SearchMovieListUC(searchRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<SearchTvListUC>(
        () => SearchTvListUC(searchRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<SearchPersonListUC>(
        () => SearchPersonListUC(searchRepository: Get.find()),
        fenix: true,
      );
  }
}
