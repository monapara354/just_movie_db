import 'package:just_movie/core/shared/domain/usecase/usecase.dart';
import 'package:just_movie/core/utils/generic_typedefs.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';

class GetMovieListUC extends UseCase<List<MovieInfo>, GetMovieListParams> {
  final HomeRepository homeRepository;

  GetMovieListUC({required this.homeRepository});

  @override
  EitherDynamic<List<MovieInfo>> call(GetMovieListParams params) {
    return homeRepository.getMovieList(params);
  }
}

class GetMovieListParams {
  final String type;

  GetMovieListParams({required this.type});
}
