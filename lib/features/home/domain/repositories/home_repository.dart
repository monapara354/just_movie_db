import 'package:dartz/dartz.dart';
import 'package:just_movie/core/domain/entity/type_def.dart';
import 'package:just_movie/core/domain/error/failure.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';


abstract class HomeRepository{
  EitherDynamic<List<MovieInfo>> getNowPlayingMovie();
}