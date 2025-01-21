import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:just_movie/core/shared/domain/error/failure.dart";
import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/core/utils/utils.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/home/domain/usecases/get_all_movie.dart";
import "package:just_movie/features/home/domain/usecases/get_all_tv.dart";
import "package:just_movie/features/home/domain/usecases/get_tranding.dart";

class HomeController extends GetxController {
  HomeController({
    required this.getMovieListUC,
    required this.getTrendingListUC,
    required this.getTrendingTVListUC,
    required this.getTvListUC,
  });

  final GetMovieListUC getMovieListUC;
  final GetTrendingListUC getTrendingListUC;
  final GetTrendingTVListUC getTrendingTVListUC;
  final GetTvListUC getTvListUC;

  RxList<MovieResult> nowPlayingMovieList = <MovieResult>[].obs;
  RxList<MovieResult> upcomingMovieList = <MovieResult>[].obs;
  RxList<MovieResult> popularMovieList = <MovieResult>[].obs;
  RxList<MovieResult> topRatedMovieList = <MovieResult>[].obs;
  RxList<MovieResult> trendingMovieList = <MovieResult>[].obs;
  RxList<TvResult> trendingTvList = <TvResult>[].obs;
  RxList<TvResult> netflixTvList = <TvResult>[].obs;
  RxList<TvResult> amazonTvList = <TvResult>[].obs;
  RxList<TvResult> disneyTvList = <TvResult>[].obs;

  RxBool isLoading = true.obs;
  RxBool isTvLoading = true.obs;

  RxList<MovieResult> moreMovieList = <MovieResult>[].obs;
  int movieCurrentPage = 1;
  RxBool movieLoading = false.obs;
  RxBool movieHasMoreData = true.obs;

  List moviesList = [
    {
      "id": 1,
      "title": "100 Years at the time of",
      "url":
          "https://m.media-amazon.com/images/M/MV5BMWY3YWY1OTktNjc3Ni00NThiLWI0ODYtOTNjM2E4YjQ2MmJkXkEyXkFqcGdeQXVyMjcyMzI2OTQ@._V1_.jpg",
    },
    {
      "id": 2,
      "title": "Avatar",
      "url":
          "https://m.media-amazon.com/images/M/MV5BNmM1NmY4N2QtNmVkOS00MjMyLWI5ZGUtYWYxMDRjY2MzNDdiXkEyXkFqcGdeQXVyMTAwMDAwMA@@._V1_.jpg",
    },
    {
      "id": 3,
      "title": "100 Years",
      "url":
          "https://m.media-amazon.com/images/M/MV5BMWY3YWY1OTktNjc3Ni00NThiLWI0ODYtOTNjM2E4YjQ2MmJkXkEyXkFqcGdeQXVyMjcyMzI2OTQ@._V1_.jpg",
    },
    {
      "id": 4,
      "title": "Avatar 4",
      "url":
          "https://m.media-amazon.com/images/M/MV5BNmM1NmY4N2QtNmVkOS00MjMyLWI5ZGUtYWYxMDRjY2MzNDdiXkEyXkFqcGdeQXVyMTAwMDAwMA@@._V1_.jpg",
    },
  ];

  Future<void> getAllMovie() async {
    await Future.delayed(
      const Duration(),
      () async {
        await getNowPlayingMovie();
        await getUpcomingMovie();
        await getPopularMovie();
        await getTopRatedMovie();
        await getTrendingTvShow();
        await getNetflixTvShow();
        await getAmazonTvShow();
        await getDisneyTvShow();
        await Future.delayed(
          const Duration(milliseconds: 800),
          () {
            isLoading.value = false;
          },
        );
      },
    );
  }

  Future<void> getMoreMovie() async {
    if (movieLoading.value || !movieHasMoreData.value) {
      return;
    }
    movieLoading.value = true;
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
      showToast(title: error);
      debugPrint(error);
    }, (right) {
      if (right.results != null && right.results!.isNotEmpty) {
        moreMovieList.addAll(right.results!);
      } else {
        movieHasMoreData.value = false;
      }
      if (right.page == movieCurrentPage) {
        movieHasMoreData.value = false;
        movieCurrentPage--;
      } else {
        movieHasMoreData.value = true;
        movieCurrentPage++;
      }
      movieLoading.value = false;
    });
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
      showToast(title: error);
      debugPrint(error);
    }, (right) {
      nowPlayingMovieList..clear()
      ..value = right.results ?? [];
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
      debugPrint(error);
    }, (right) {
      upcomingMovieList..clear()
      ..value = right.results ?? [];
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
      debugPrint(error);
    }, (right) {
      popularMovieList..clear()
      ..value = right.results ?? [];
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
      debugPrint(error);
    }, (right) {
      topRatedMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getTrendingMovie() async {
    final getTrendingFailedOrSuccess = await getTrendingListUC(
        GetTrendingListParams(type: EndPoints.urlMovie),);
    getTrendingFailedOrSuccess.fold((left) {
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
      trendingMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getTrendingTvShow() async {
    isTvLoading.value = true;
    final getTrendingTvFailedOrSuccess = await getTrendingTVListUC(NoParams());
    getTrendingTvFailedOrSuccess.fold((left) {
      isTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isTvLoading.value = false;
      trendingTvList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getNetflixTvShow() async {
    isTvLoading.value = true;
    final getTvFailedOrSuccess = await getTvListUC(
      GetTvListParams(type: NetworkProvider.netflix),
    );
    getTvFailedOrSuccess.fold((left) {
      isTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isTvLoading.value = false;
      netflixTvList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getAmazonTvShow() async {
    isTvLoading.value = true;
    final getTvFailedOrSuccess = await getTvListUC(
      GetTvListParams(type: NetworkProvider.amazon),
    );
    getTvFailedOrSuccess.fold((left) {
      isTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isTvLoading.value = false;
      amazonTvList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getDisneyTvShow() async {
    isTvLoading.value = true;
    final getTvFailedOrSuccess = await getTvListUC(
      GetTvListParams(type: NetworkProvider.disney),
    );
    getTvFailedOrSuccess.fold((left) {
      isTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isTvLoading.value = false;
      disneyTvList..clear()
      ..value = right.results ?? [];
    });
  }


  ScrollController allMovieScroll = ScrollController();

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    await getAllMovie();
    allMovieScroll.addListener(() {
      if (allMovieScroll.position.pixels ==
              allMovieScroll.position.maxScrollExtent &&
          movieHasMoreData.value) {
        getMoreMovie();
      }
    });
  }
}
