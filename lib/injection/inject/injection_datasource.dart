import "package:get/get.dart";
import "package:just_movie/features/home/data/datasource/home_datasource.dart";
import "package:just_movie/features/movie_details/data/datasource/movie_detail_datasource.dart";
import "package:just_movie/features/search/data/datasource/search_datasource.dart";

class InjectionDataSource {
  InjectionDataSource.inject() {
    Get
      ..lazyPut<HomeDataSource>(
        HomeDataSourceImpl.new,
        fenix: true,
      )
      ..lazyPut<MovieDetailDatasource>(
        MovieDetailDatasourceImpl.new,
        fenix: true,
      )
      ..lazyPut<SearchDatasource>(
        SearchDatasourceImpl.new,
        fenix: true,
      );
  }
}
