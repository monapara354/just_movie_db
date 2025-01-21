import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/movie_details/domain/entities/movie_detail.dart";
import "package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart";

class GetMovieDetailUC extends UseCase<MovieDetail, GetMovieDetailParams> {

  GetMovieDetailUC({required this.movieDetailRepository});
  final MovieDetailRepository movieDetailRepository;
  @override
  EitherDynamic<MovieDetail> call(GetMovieDetailParams params) {
    return movieDetailRepository.getMovieDetail(params);
  }
}

class GetMovieDetailParams {

  GetMovieDetailParams({required this.refId});
  final int refId;
}
