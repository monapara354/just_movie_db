import 'package:dio/dio.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/shared/domain/error/failure.dart';

import 'package:just_movie/features/home/data/model/movie_info_model.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

abstract class HomeDataSource {
  Future<List<MovieInfoModel>> getMovieList(GetMovieListParams params);
  Future<List<MovieInfoModel>> getTrendingList(GetTrendingListParams params);
}

class HomeDataSourceImpl extends HomeDataSource {
  final dio = Dio();

  @override
  Future<List<MovieInfoModel>> getMovieList(GetMovieListParams params) async {
    try {
      List<MovieInfoModel> movieList = [];

      final url =
          '${EndPoints.baseUrl}/movie/${params.type}?api_key=${EndPoints.apiKey}&region=IN';
      final response = await dio.get(url);
      final data = response.data;

      if (response.statusCode == 200) {
        for (var d in data['results']) {
          final movie = MovieInfoModel.fromJson(d);
          movieList.add(movie);
        }
      }
      return movieList;
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<List<MovieInfoModel>> getTrendingList(
      GetTrendingListParams params) async {
    try {
      List<MovieInfoModel> movieList = [];

      final url =
          '${EndPoints.baseUrl}/trending/${params.type}/day?api_key=${EndPoints.apiKey}';
      final response = await dio.get(url);
      final data = response.data;

      if (response.statusCode == 200) {
        for (var d in data['results']) {
          final movie = MovieInfoModel.fromJson(d);
          movieList.add(movie);
        }
      }
      return movieList;
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }
}
