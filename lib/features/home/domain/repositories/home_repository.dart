import 'package:dartz/dartz.dart';
import 'package:just_movie/core/domain/entity/type_def.dart';
import 'package:just_movie/core/domain/error/failure.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';


abstract class HomeRepository{
  EitherDynamic<List<MovieInfo>> getMovieList(GetMovieListParams getMovieListParams);
  EitherDynamic<List<MovieInfo>> getTrendingList(GetTrendingListParams getTrendingListParams);
}