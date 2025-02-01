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


  RxBool isNowMovieLoading = true.obs;
  RxBool isUpcomingLoading = true.obs;
  RxBool isPopularLoading = true.obs;
  RxBool isTopRatedLoading = true.obs;
  RxBool isTrendingMovieLoading = true.obs;
  RxBool isTrendingTvLoading = true.obs;
  RxBool isNetflixTvLoading = true.obs;
  RxBool isAmazonTvLoading = true.obs;
  RxBool isDisneyTvLoading = true.obs;

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
         getTrendingTvShow();
         getNetflixTvShow();
         getAmazonTvShow();
         getDisneyTvShow();
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
    isNowMovieLoading.value = true;
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
      isNowMovieLoading.value = false;
      showToast(title: error);
      debugPrint(error);
    }, (right) {
      isNowMovieLoading.value = false;
      nowPlayingMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getUpcomingMovie() async {
    isUpcomingLoading.value = true;
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
      isUpcomingLoading.value = false;
      // showToast(title: error);
      debugPrint(error);
    }, (right) {
      isUpcomingLoading.value = false;
      upcomingMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getPopularMovie() async {
    isPopularLoading.value = true;
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
      isPopularLoading.value = false;
      // showToast(title: error);
      debugPrint(error);
    }, (right) {
      isPopularLoading.value = false;
      popularMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getTopRatedMovie() async {
    isTopRatedLoading.value = true;
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
      isTopRatedLoading.value = false;
      // showToast(title: error);
      debugPrint(error);
    }, (right) {
      isTopRatedLoading.value = false;
      topRatedMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getTrendingMovie() async {
    isTrendingMovieLoading.value = true;
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
      isTrendingMovieLoading.value = false;
      // showToast(title: error);
      debugPrint(error);
    }, (right) {
      isTrendingMovieLoading.value = false;
      trendingMovieList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getTrendingTvShow() async {
    isTrendingTvLoading.value = true;
    final getTrendingTvFailedOrSuccess = await getTrendingTVListUC(NoParams());
    getTrendingTvFailedOrSuccess.fold((left) {
      isTrendingTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isTrendingTvLoading.value = false;
      trendingTvList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getNetflixTvShow() async {
    isNetflixTvLoading.value = true;
    final getTvFailedOrSuccess = await getTvListUC(
      GetTvListParams(type: NetworkProvider.netflix),
    );
    getTvFailedOrSuccess.fold((left) {
      isNetflixTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isNetflixTvLoading.value = false;
      netflixTvList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getAmazonTvShow() async {
    isAmazonTvLoading.value = true;
    final getTvFailedOrSuccess = await getTvListUC(
      GetTvListParams(type: NetworkProvider.amazon),
    );
    getTvFailedOrSuccess.fold((left) {
      isAmazonTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isAmazonTvLoading.value = false;
      amazonTvList..clear()
      ..value = right.results ?? [];
    });
  }

  Future<void> getDisneyTvShow() async {
    isDisneyTvLoading.value = true;
    final getTvFailedOrSuccess = await getTvListUC(
      GetTvListParams(type: NetworkProvider.disney),
    );
    getTvFailedOrSuccess.fold((left) {
      isDisneyTvLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      isDisneyTvLoading.value = false;
      disneyTvList..clear()
      ..value = right.results ?? [];
    });
  }


  ScrollController allMovieScroll = ScrollController();

  @override
  Future<void> onInit() async {
    super.onInit();
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
