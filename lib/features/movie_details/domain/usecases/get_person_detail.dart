import 'package:just_movie/core/shared/domain/usecase/usecase.dart';
import 'package:just_movie/core/utils/generic_typedefs.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/movie_details/domain/entities/person.dart';
import 'package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart';

class GetPersonDetailUC extends UseCase<Person, GetPersonDetailParams> {
  final MovieDetailRepository movieDetailRepository;

  GetPersonDetailUC({required this.movieDetailRepository});
  @override
  EitherDynamic<Person> call(GetPersonDetailParams params) {
    return movieDetailRepository.getPersonDetail(params);
  }
}

class GetPersonDetailParams {
  final int refId;

  GetPersonDetailParams({required this.refId});
}

class GetPersonMoviesUC
    extends UseCase<List<MovieInfo>, GetPersonDetailParams> {
  final MovieDetailRepository movieDetailRepository;

  GetPersonMoviesUC({required this.movieDetailRepository});
  @override
  EitherDynamic<List<MovieInfo>> call(GetPersonDetailParams params) {
    return movieDetailRepository.getPersonMovies(params);
  }
}
