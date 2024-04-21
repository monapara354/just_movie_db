import 'package:dartz/dartz.dart';
import 'package:just_movie/core/domain/entity/type_def.dart';
import 'package:just_movie/core/domain/error/failure.dart';
import 'package:just_movie/features/movie_details/data/datasource/movie_detail_datasource.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDatasource movieDetailDatasource;

  MovieDetailRepositoryImpl({required this.movieDetailDatasource});

  @override
  EitherDynamic<MovieDetail> getMovieDetail(
      GetMovieDetailParams getMovieDetailParams) async {
    try {
      final data =
          await movieDetailDatasource.getMovieDetail(getMovieDetailParams);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
