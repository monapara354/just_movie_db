
import 'package:just_movie/core/domain/entity/type_def.dart';
import 'package:just_movie/core/domain/usecase/usecase.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';

class GetNowPlayingMovieUC extends UseCase<List<MovieInfo>,NoParams>{
  final HomeRepository homeRepository;

  GetNowPlayingMovieUC({required this.homeRepository});

  @override
  EitherDynamic<List<MovieInfo>> call(NoParams params) {
    return homeRepository.getNowPlayingMovie();
  }


}