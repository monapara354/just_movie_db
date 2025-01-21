import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/domain/entities/person.dart";
import "package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart";

class GetPersonDetailUC extends UseCase<Person, GetPersonDetailParams> {

  GetPersonDetailUC({required this.movieDetailRepository});
  final MovieDetailRepository movieDetailRepository;
  @override
  EitherDynamic<Person> call(GetPersonDetailParams params) {
    return movieDetailRepository.getPersonDetail(params);
  }
}

class GetPersonDetailParams {

  GetPersonDetailParams({required this.refId});
  final int refId;
}

class GetPersonMoviesUC
    extends UseCase<List<MovieResult>, GetPersonDetailParams> {

  GetPersonMoviesUC({required this.movieDetailRepository});
  final MovieDetailRepository movieDetailRepository;
  @override
  EitherDynamic<List<MovieResult>> call(GetPersonDetailParams params) {
    return movieDetailRepository.getPersonMovies(params);
  }
}

class GetPersonTvShowUC extends UseCase<List<TvResult>, GetPersonDetailParams> {

  GetPersonTvShowUC({required this.movieDetailRepository});
  final MovieDetailRepository movieDetailRepository;
  @override
  EitherDynamic<List<TvResult>> call(GetPersonDetailParams params) {
    return movieDetailRepository.getPersonTvShow(params);
  }
}
