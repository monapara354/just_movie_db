import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/services/api_service.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/error/exception.dart';
import 'package:just_movie/features/home/data/model/movie_info_model.dart';

import 'package:just_movie/features/movie_details/data/model/cast_crew_model.dart';
import 'package:just_movie/features/movie_details/data/model/movie_detail_model.dart';
import 'package:just_movie/features/movie_details/data/model/person_model.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_cast_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_person_detail.dart';

abstract class MovieDetailDatasource {
  Future<MovieDetailModel> getMovieDetail(GetMovieDetailParams params);
  Future<CastCrewModel> getCastDetail(GetCastDetailParams params);
  Future<PersonModel> getPersonDetail(GetPersonDetailParams params);
  Future<List<MovieInfoModel>> getPersonMovies(GetPersonDetailParams params);
}

class MovieDetailDatasourceImpl extends MovieDetailDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<MovieDetailModel> getMovieDetail(GetMovieDetailParams params) async {
    try {
      print('aaaa-----${params.refId}');

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
      print('aaaa-----${params.refId}');

      final response = await apiService.getRequest(
        path: "${ApiUrl.movie}${params.refId}${ApiUrl.credits}",
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
      print('aaaa-----${params.refId}');

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
  Future<List<MovieInfoModel>> getPersonMovies(
      GetPersonDetailParams params) async {
    try {
      List<MovieInfoModel> movieList = [];
      final response = await apiService.getRequest(
        path: "${ApiUrl.person}${params.refId}${ApiUrl.movieCredits}",
      );
      if (response.statusCode == 200) {
        for (var d in response.data["cast"]) {
          final movie = MovieInfoModel.fromJson(d);
          movieList.add(movie);
        }
      }
      return movieList;
    } catch (e) {
      print("error--=----- ${e.toString()}");
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }
}
