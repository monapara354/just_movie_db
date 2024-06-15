import 'package:dartz/dartz.dart';
import 'package:just_movie/core/shared/domain/entity/type_def.dart';
import 'package:just_movie/core/shared/domain/error/failure.dart';

import 'package:just_movie/features/home/data/datasource/home_datasource.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  EitherDynamic<List<MovieInfo>> getMovieList(
      GetMovieListParams getMovieListParams) async {
    try {
      final data = await homeDataSource.getMovieList(getMovieListParams);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  EitherDynamic<List<MovieInfo>> getTrendingList(
      GetTrendingListParams getTrendingListParams) async {
    try {
      final data = await homeDataSource.getTrendingList(getTrendingListParams);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
