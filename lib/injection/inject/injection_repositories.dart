import "package:get/get.dart";
import "package:just_movie/features/home/data/repositories/home_repository_impl.dart";
import "package:just_movie/features/home/domain/repositories/home_repository.dart";
import "package:just_movie/features/movie_details/data/repositories/movie_detail_repository_impl.dart";
import "package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart";
import "package:just_movie/features/search/data/repositories/search_repository_impl.dart";
import "package:just_movie/features/search/domain/repositories/search_repository.dart";

class InjectionRepositories {
  InjectionRepositories.inject() {
    Get
      ..lazyPut<HomeRepository>(
        () => HomeRepositoryImpl(homeDataSource: Get.find()),
        fenix: true,
      )
      ..lazyPut<MovieDetailRepository>(
        () => MovieDetailRepositoryImpl(movieDetailDatasource: Get.find()),
        fenix: true,
      )
      ..lazyPut<SearchRepository>(
        () => SearchRepositoryImpl(searchDatasource: Get.find()),
        fenix: true,
      );
  }
}
