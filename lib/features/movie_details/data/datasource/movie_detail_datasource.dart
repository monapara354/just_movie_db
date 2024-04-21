import 'package:dio/dio.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/domain/error/failure.dart';
import 'package:just_movie/features/movie_details/data/model/movie_detail_model.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';

abstract class MovieDetailDatasource {
  Future<MovieDetailModel> getMovieDetail(GetMovieDetailParams params);
}

class MovieDetailDatasourceImpl extends MovieDetailDatasource {
  final dio = Dio();

  @override
  Future<MovieDetailModel> getMovieDetail(GetMovieDetailParams params) async {
    try {
      final url = '${EndPoints.baseUrl}/movie/${params.refId}?api_key=${EndPoints.apiKey}';
      final response = await dio.get(url);
      final data = response.data;

      final movie = MovieDetailModel.fromJson(data);
      if (response.statusCode == 200) {
        return movie;
      }
      return movie;
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }
}
