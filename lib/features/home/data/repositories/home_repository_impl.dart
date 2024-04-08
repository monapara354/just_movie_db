
import 'package:dartz/dartz.dart';
import 'package:just_movie/core/domain/entity/type_def.dart';
import 'package:just_movie/core/domain/error/failure.dart';
import 'package:just_movie/features/home/data/datasource/home_datasource.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});
  @override
  EitherDynamic<List<MovieInfo>> getNowPlayingMovie()async {
    try{
      final data = await homeDataSource.getNowPlayingMovie();
      return Right(data);
    }catch(e){
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

}