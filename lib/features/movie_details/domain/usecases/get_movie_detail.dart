import 'package:just_movie/core/domain/entity/type_def.dart';
import 'package:just_movie/core/domain/usecase/usecase.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart';

class GetMovieDetailUC extends UseCase<MovieDetail,GetMovieDetailParams>{
  final MovieDetailRepository movieDetailRepository;

  GetMovieDetailUC({required this.movieDetailRepository});
  @override
  EitherDynamic<MovieDetail> call(GetMovieDetailParams params) {
    return movieDetailRepository.getMovieDetail(params);
  }

}

class GetMovieDetailParams {
  final int refId;

  GetMovieDetailParams({required this.refId});
}