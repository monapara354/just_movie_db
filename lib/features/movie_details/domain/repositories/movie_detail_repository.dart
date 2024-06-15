import 'package:just_movie/core/shared/domain/entity/type_def.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';

abstract class MovieDetailRepository {
  EitherDynamic<MovieDetail> getMovieDetail(
      GetMovieDetailParams getMovieDetailParams);
}
