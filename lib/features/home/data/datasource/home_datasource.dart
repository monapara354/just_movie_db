import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/services/api_service.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/error/exception.dart';
import 'package:just_movie/core/utils/generic_enums.dart';

import 'package:just_movie/features/home/data/model/movie_info_model.dart';
import 'package:just_movie/features/home/data/model/tv_info_model.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_tv.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

abstract class HomeDataSource {
  Future<List<MovieInfoModel>> getMovieList(GetMovieListParams params);
  Future<List<MovieInfoModel>> getTrendingList(GetTrendingListParams params);
  Future<TvInfoModel> getTrendingTvList();
  Future<TvInfoModel> getTvList(GetTvListParams params);
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

  @override
  Future<TvInfoModel> getTrendingTvList() async {
    try {
      TvInfoModel tvInfoModel = TvInfoModel();

      final response = await apiService.getRequest(path: ApiUrl.trendingTV);
      if (response.statusCode == 200) {
        final tv = TvInfoModel.fromJson(response.data);
        tvInfoModel = tv;
      }

      return tvInfoModel;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }

  void aaa() {
    switch (NetworkProvider) {
      case NetworkProvider.netflix:
        break;
      default:
    }
  }

  @override
  Future<TvInfoModel> getTvList(GetTvListParams params) async {
    try {
      final value = switch (params.type) {
        NetworkProvider.netflix => 213,
        NetworkProvider.amazon => 2739,
        NetworkProvider.disney => 1024,
        _ => 213,
      };

      TvInfoModel tvInfoModel = TvInfoModel();

      final response = await apiService.getRequest(
        path: ApiUrl.discoverTV,
        queryParams: {
          "sort_by": "popularity.desc",
          "timezone": "day",
          "watch_region": "IN",
          "with_networks": value,
        },
      );
      if (response.statusCode == 200) {
        final tv = TvInfoModel.fromJson(response.data);
        tvInfoModel = tv;
      }

      return tvInfoModel;
    } catch (e) {
      throw ServerException(error: StringConstants.strSomethingWrong);
    }
  }
}
