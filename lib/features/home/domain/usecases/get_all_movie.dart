import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/repositories/home_repository.dart";

class GetMovieListUC extends UseCase<MovieInfo, GetMovieListParams> {

  GetMovieListUC({required this.homeRepository});
  final HomeRepository homeRepository;

  @override
  EitherDynamic<MovieInfo> call(GetMovieListParams params) {
    return homeRepository.getMovieList(params);
  }
}

class GetMovieListParams {

  GetMovieListParams({required this.type});
  final String type;
}
