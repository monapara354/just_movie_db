import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/error/failure.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

class HomeController extends GetxController {
  HomeController({
    required this.getMovieListUC,
    required this.getTrendingListUC,
  });

  final GetMovieListUC getMovieListUC;
  final GetTrendingListUC getTrendingListUC;

  RxList<MovieInfo> nowPlayingMovieList = <MovieInfo>[].obs;
  RxList<MovieInfo> upcomingMovieList = <MovieInfo>[].obs;
  RxList<MovieInfo> popularMovieList = <MovieInfo>[].obs;
  RxList<MovieInfo> topRatedMovieList = <MovieInfo>[].obs;
  RxList<MovieInfo> trendingMovieList = <MovieInfo>[].obs;

  RxBool isLoading = true.obs;

  List moviesList = [
    {
      'id': 1,
      'title': '100 Years at the time of',
      'url':
          'https://m.media-amazon.com/images/M/MV5BMWY3YWY1OTktNjc3Ni00NThiLWI0ODYtOTNjM2E4YjQ2MmJkXkEyXkFqcGdeQXVyMjcyMzI2OTQ@._V1_.jpg'
    },
    {
      'id': 2,
      'title': 'Avatar',
      'url':
          'https://m.media-amazon.com/images/M/MV5BNmM1NmY4N2QtNmVkOS00MjMyLWI5ZGUtYWYxMDRjY2MzNDdiXkEyXkFqcGdeQXVyMTAwMDAwMA@@._V1_.jpg'
    },
    {
      'id': 3,
      'title': '100 Years',
      'url':
          'https://m.media-amazon.com/images/M/MV5BMWY3YWY1OTktNjc3Ni00NThiLWI0ODYtOTNjM2E4YjQ2MmJkXkEyXkFqcGdeQXVyMjcyMzI2OTQ@._V1_.jpg'
    },
    {
      'id': 4,
      'title': 'Avatar 4',
      'url':
          'https://m.media-amazon.com/images/M/MV5BNmM1NmY4N2QtNmVkOS00MjMyLWI5ZGUtYWYxMDRjY2MzNDdiXkEyXkFqcGdeQXVyMTAwMDAwMA@@._V1_.jpg'
    },
  ];

  Future<void> getAllMovie() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () async {
        await getNowPlayingMovie();
        await getUpcomingMovie();
        await getPopularMovie();
        await getTopRatedMovie();
        await Future.delayed(
          const Duration(milliseconds: 800),
          () {
            isLoading.value = false;
          },
        );
      },
    );
  }

  Future<void> getNowPlayingMovie() async {
    final getNowPlayingFailedOrSuccess = await getMovieListUC(
      GetMovieListParams(type: EndPoints.urlNowPlaying),
    );

    getNowPlayingFailedOrSuccess.fold((left) {
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }
      // showToast(title: error);
      debugPrint(error);
    }, (right) {
      nowPlayingMovieList.clear();
      nowPlayingMovieList.value = right;
    });
  }

  Future<void> getUpcomingMovie() async {
    final getUpcomingFailedOrSuccess =
        await getMovieListUC(GetMovieListParams(type: EndPoints.urlUpcoming));
    getUpcomingFailedOrSuccess.fold((left) {
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }
      // showToast(title: error);
      debugPrint(left.errorMessage);
    }, (right) {
      upcomingMovieList.clear();
      upcomingMovieList.value = right;
    });
  }

  Future<void> getPopularMovie() async {
    final getPopularFailedOrSuccess =
        await getMovieListUC(GetMovieListParams(type: EndPoints.urlPopular));
    getPopularFailedOrSuccess.fold((left) {
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }
      // showToast(title: error);
      debugPrint(left.errorMessage);
    }, (right) {
      popularMovieList.clear();
      popularMovieList.value = right;
    });
  }

  Future<void> getTopRatedMovie() async {
    final getTopRatedFailedOrSuccess =
        await getMovieListUC(GetMovieListParams(type: EndPoints.urlTopRated));
    getTopRatedFailedOrSuccess.fold((left) {
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }
      // showToast(title: error);
      debugPrint(left.errorMessage);
    }, (right) {
      topRatedMovieList.clear();
      topRatedMovieList.value = right;
    });
  }

  Future<void> getTrendingMovie() async {
    final getTrendingFailedOrSuccess = await getTrendingListUC(
        GetTrendingListParams(type: EndPoints.urlMovie));
    getTrendingFailedOrSuccess.fold((left) {
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }
      // showToast(title: error);
      debugPrint(left.errorMessage);
    }, (right) {
      trendingMovieList.clear();
      trendingMovieList.value = right;
    });
  }

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'c37e879922024e7b447766addfb964a2';
  final dio = Dio();

  Future<void> getMovues() async {
    final url = '$baseUrl/movie/now_playing?api_key=$apiKey';
    final response = await dio.get(url);
    final data = response.data;
    //jsonDecode(response.data.toString());
    // final data =jsonDecode(data2);

    if (response.statusCode == 200) {
      print('00000000%$data');
      // List aaa = data['results'];
      print(data['results']);
      for (var i in data['results'] as List) {
        print(i);
      }
      // return data['results'];
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    await getAllMovie();
  }
}
