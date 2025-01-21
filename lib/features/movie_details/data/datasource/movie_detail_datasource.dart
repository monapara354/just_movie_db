import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/services/api_service.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:just_movie/core/shared/domain/error/exception.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/features/home/data/model/movie_info_model.dart";
import "package:just_movie/features/home/data/model/tv_info_model.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/data/model/cast_crew_model.dart";
import "package:just_movie/features/movie_details/data/model/movie_detail_model.dart";
import "package:just_movie/features/movie_details/data/model/person_model.dart";
import "package:just_movie/features/movie_details/data/model/tv_detail_model.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_cast_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_person_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_tv_detail.dart";

abstract class MovieDetailDatasource {
  Future<MovieDetailModel> getMovieDetail(GetMovieDetailParams params);
  Future<CastCrewModel> getCastDetail(GetCastDetailParams params);
  Future<PersonModel> getPersonDetail(GetPersonDetailParams params);
  Future<List<MovieResultModel>> getPersonMovies(GetPersonDetailParams params);
  Future<TvDetailModel> getTvDetail(GetTvDetailParams params);
  Future<List<TvResult>> getPersonTvShow(GetPersonDetailParams params);
}

class MovieDetailDatasourceImpl extends MovieDetailDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<MovieDetailModel> getMovieDetail(GetMovieDetailParams params) async {
    try {

      final response = await apiService.getRequest(
        path: "${ApiUrl.movie}${params.refId}",
      );

      if (response.statusCode == 200) {
        final movie = MovieDetailModel.fromJson(response.data);
        return movie;
      }
      return throw ServerException(error: StringConstants.strSomethingWrong);
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  @override
  Future<CastCrewModel> getCastDetail(GetCastDetailParams params) async {
    try {

      final response = await apiService.getRequest(
        path:
            "${params.credit == Credit.movie ? ApiUrl.movie : ApiUrl.tv}${params.refId}${ApiUrl.credits}",
      );

      if (response.statusCode == 200) {
        final castCrew = CastCrewModel.fromJson(response.data);
        return castCrew;
      }

      return throw ServerException(error: StringConstants.strSomethingWrong);
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  @override
  Future<PersonModel> getPersonDetail(GetPersonDetailParams params) async {
    try {
      final response = await apiService.getRequest(
        path: "${ApiUrl.person}${params.refId}",
      );

      if (response.statusCode == 200) {
        final person = PersonModel.fromJson(response.data);
        return person;
      }

      return throw ServerException(error: StringConstants.strSomethingWrong);
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  @override
  Future<List<MovieResultModel>> getPersonMovies(
    GetPersonDetailParams params,
  ) async {
    try {
      final List<MovieResultModel> movieList = [];
      final response = await apiService.getRequest(
        path: "${ApiUrl.person}${params.refId}${ApiUrl.movieCredits}",
      );
      if (response.statusCode == 200) {
        for (final d in response.data["cast"]) {
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
  Future<TvDetailModel> getTvDetail(GetTvDetailParams params) async {
    try {

      final response = await apiService.getRequest(
        path: "${ApiUrl.tv}${params.refId}",
      );

      if (response.statusCode == 200) {
        final tv = TvDetailModel.fromJson(response.data);
        return tv;
      }
      return throw ServerException(error: StringConstants.strSomethingWrong);
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  @override
  Future<List<TvResult>> getPersonTvShow(GetPersonDetailParams params) async {
    try {
      final List<TvResult> tvList = [];
      final response = await apiService.getRequest(
        path: "${ApiUrl.person}${params.refId}${ApiUrl.tvCredits}",
      );
      if (response.statusCode == 200) {
        for (final d in response.data["cast"]) {
          final tv = TvResultModel.fromJson(d);
          tvList.add(tv);
        }
      }
      return tvList;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }
}
