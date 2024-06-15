import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';

class MovieDetailController extends GetxController {
  final GetMovieDetailUC getMovieDetailUC;

  MovieDetailController({required this.getMovieDetailUC});

  Rxn<MovieDetail> movieInfo = Rxn<MovieDetail>();

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, ' ')}h ${parts[1].padLeft(2, '0')}m';
  }

  Future<void> getMovieDetail(int refId) async {
    movieInfo.value = null;
    final getMovieDetailFailedOrSuccess = await getMovieDetailUC(
      GetMovieDetailParams(refId: refId),
    );
    getMovieDetailFailedOrSuccess.fold((l) {
      debugPrint(l.errorMessage);
    }, (r) {

      movieInfo.value = r;
    });
  }
}
