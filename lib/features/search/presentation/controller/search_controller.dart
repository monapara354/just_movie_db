import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/shared/domain/error/failure.dart";
import "package:just_movie/core/utils/utils.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/search/domain/usecases/search_movie.dart";

class SearchXController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SearchXController({
    required this.searchMovieListUC,
    required this.searchTvListUC,
    required this.searchPersonListUC,
  });

  final SearchMovieListUC searchMovieListUC;
  final SearchTvListUC searchTvListUC;
  final SearchPersonListUC searchPersonListUC;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: StringConstants.strMovies),
    const Tab(text: StringConstants.strTvShows),
    const Tab(text: StringConstants.strPeople),
  ];

  late TabController tabController;
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  RxList<MovieResult> searchMovieList = <MovieResult>[].obs;
  RxList<TvResult> searchTvList = <TvResult>[].obs;
  RxList<Cast> searchPersonList = <Cast>[].obs;

  RxBool isMovieLoading = false.obs;
  RxBool isTvShowLoading = false.obs;
  RxBool isPersonLoading = false.obs;

  Future<void> getSearchMovie() async {
    isMovieLoading.value = true;
    final getSearchFailedOrSuccess = await searchMovieListUC(
      SearchListParams(searchText: searchTextController.text),
    );

    getSearchFailedOrSuccess.fold((left) {
      isMovieLoading.value = false;
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
      isMovieLoading.value = false;
      searchMovieList.value = right;
    });
  }

  Future<void> getSearchTvShow() async {
    isTvShowLoading.value = true;
    final getSearchFailedOrSuccess = await searchTvListUC(
      SearchListParams(searchText: searchTextController.text),
    );

    getSearchFailedOrSuccess.fold((left) {
      isTvShowLoading.value = false;
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
      isTvShowLoading.value = false;
      searchTvList.value = right;
    });
  }

  Future<void> getSearchPerson() async {
    isPersonLoading.value = true;
    final getSearchFailedOrSuccess = await searchPersonListUC(
      SearchListParams(searchText: searchTextController.text),
    );

    getSearchFailedOrSuccess.fold((left) {
      isPersonLoading.value = false;
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
      isPersonLoading.value = false;
      searchPersonList.value = right;
    });
  }
}
