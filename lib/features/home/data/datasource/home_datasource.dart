import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/services/api_service.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/error/exception.dart';

import 'package:just_movie/features/home/data/model/movie_info_model.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

abstract class HomeDataSource {
  Future<List<MovieInfoModel>> getMovieList(GetMovieListParams params);
  Future<List<MovieInfoModel>> getTrendingList(GetTrendingListParams params);
}

class HomeDataSourceImpl extends HomeDataSource {
  final apiService = Get.find<ApiService>();

  @override
  Future<List<MovieInfoModel>> getMovieList(GetMovieListParams params) async {
    try {
      List<MovieInfoModel> movieList = [];
      final response = await apiService.getRequest(
        path: "${ApiUrl.movie}${params.type}",
        queryParams: {"region": "IN"},
      );
      if (response.statusCode == 200) {
        for (var d in response.data["results"]) {
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

  @override
  Future<List<MovieInfoModel>> getTrendingList(
      GetTrendingListParams params) async {
    try {
      List<MovieInfoModel> movieList = [];

      final response = await apiService.getRequest(
        path: ApiUrl.trendingMovie,
      );
      if (response.statusCode == 200) {
        for (var d in response.data["results"]) {
          final movie = MovieInfoModel.fromJson(d);
          movieList.add(movie);
        }
      }

      return movieList;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }
}
