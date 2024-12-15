import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/shared/domain/error/failure.dart';
import 'package:just_movie/core/utils/utils.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/movie_details/domain/entities/cast_crew.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/entities/person.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_cast_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_person_detail.dart';

class MovieDetailController extends GetxController {
  final GetMovieDetailUC getMovieDetailUC;
  final GetCastDetailUC getCastDetailUC;
  final GetPersonDetailUC getPersonDetailUC;
  final GetPersonMoviesUC getPersonMoviesUC;

  MovieDetailController({
    required this.getMovieDetailUC,
    required this.getCastDetailUC,
    required this.getPersonDetailUC,
    required this.getPersonMoviesUC,
  });

  Rxn<MovieDetail> movieInfo = Rxn<MovieDetail>();
  Rxn<CastCrew> castCrew = Rxn<CastCrew>();
  Rxn<Person> personData = Rxn<Person>();
  RxList<MovieInfo> movieList = <MovieInfo>[].obs;
  RxBool isInfoLoading = false.obs;
  RxBool isPersonLoading = false.obs;
  RxBool isMovieLoading = false.obs;

  Future<void> getMovieDetail(int refId) async {
    movieInfo.value = null;
    isInfoLoading.value = true;
    final getMovieDetailFailedOrSuccess = await getMovieDetailUC(
      GetMovieDetailParams(refId: refId),
    );
    getMovieDetailFailedOrSuccess.fold(
      (left) {
        isInfoLoading.value = false;
        var error = "";
        if (left is GeneralFailure) {
          error = left.errorMessage;
        }
        if (left is ServerFailure) {
          error = left.errorMessage;
        }
        showToast(title: error);
        debugPrint(error);
      },
      (right) {
        isInfoLoading.value = false;
        movieInfo.value = right;
      },
    );
  }

  Future<void> getCastDetail(int refId) async {
    castCrew.value = null;
    final getCastDetailFailedOrSuccess = await getCastDetailUC(
      GetCastDetailParams(refId: refId),
    );
    getCastDetailFailedOrSuccess.fold(
      (left) {
        var error = "";
        if (left is GeneralFailure) {
          error = left.errorMessage;
        }
        if (left is ServerFailure) {
          error = left.errorMessage;
        }

        debugPrint(error);
      },
      (right) {
        castCrew.value = right;
      },
    );
  }

  Future<void> getPersonDetail(int refId) async {
    personData.value = null;
    isPersonLoading.value = true;
    final getPersonDetailFailedOrSuccess = await getPersonDetailUC(
      GetPersonDetailParams(refId: refId),
    );
    getPersonDetailFailedOrSuccess.fold(
      (left) {
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
      },
      (right) {
        isPersonLoading.value = false;
        personData.value = right;
      },
    );
  }

  Future<void> getPersonMovie(int refId) async {
    isMovieLoading.value = true;
    final getPersonMoviesFailedOrSuccess = await getPersonMoviesUC(
      GetPersonDetailParams(refId: refId),
    );

    getPersonMoviesFailedOrSuccess.fold((left) {
      isMovieLoading.value = false;
      var error = "";
      if (left is GeneralFailure) {
        error = left.errorMessage;
      }
      if (left is ServerFailure) {
        error = left.errorMessage;
      }

      debugPrint(error);
    }, (right) {
      movieList.clear();
      movieList.value = right.reversed.toList();
      isMovieLoading.value = false;
    });
  }
}
