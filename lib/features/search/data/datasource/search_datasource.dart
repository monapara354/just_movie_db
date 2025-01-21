import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/services/api_service.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:just_movie/core/shared/domain/error/exception.dart";
import "package:just_movie/features/home/data/model/movie_info_model.dart";
import "package:just_movie/features/home/data/model/tv_info_model.dart";
import "package:just_movie/features/movie_details/data/model/cast_crew_model.dart";

import "package:just_movie/features/search/domain/usecases/search_movie.dart";

abstract class SearchDatasource {
  Future<List<MovieResultModel>> searchMovieList(SearchListParams params);
  Future<List<TvResultModel>> searchTvList(SearchListParams params);
  Future<List<CastModel>> searchPersonList(SearchListParams params);
}

class SearchDatasourceImpl extends SearchDatasource {
  final apiService = Get.find<ApiService>();
  @override
  Future<List<MovieResultModel>> searchMovieList(
      SearchListParams params,) async {
    try {
      final List<MovieResultModel> movieList = [];
      final response = await apiService.getRequest(
        path: ApiUrl.searchMovie,
        queryParams: {"query": params.searchText},
      );
      if (response.statusCode == 200) {
        for (final d in response.data["results"]) {
          final movie = MovieResultModel.fromJson(d);
          movieList.add(movie);
        }
      }
      return movieList;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  @override
  Future<List<TvResultModel>> searchTvList(SearchListParams params) async {
    try {
      final List<TvResultModel> tvList = [];
      final response = await apiService.getRequest(
        path: ApiUrl.searchTv,
        queryParams: {"query": params.searchText},
      );
      if (response.statusCode == 200) {
        for (final d in response.data["results"]) {
          final tv = TvResultModel.fromJson(d);
          tvList.add(tv);
        }
      }
      return tvList;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  @override
  Future<List<CastModel>> searchPersonList(SearchListParams params) async {
    try {
      final List<CastModel> castList = [];
      final response = await apiService.getRequest(
        path: ApiUrl.searchPerson,
        queryParams: {"query": params.searchText},
      );

      if (response.statusCode == 200) {
        for (final d in response.data["results"]) {
          final cast = CastModel.fromJson(d);
          castList.add(cast);
        }
      }

      return castList;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }
}
