import 'package:just_movie/core/shared/domain/entity/type_def.dart';
import 'package:just_movie/core/shared/domain/usecase/usecase.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';

class GetTrendingListUC
    extends UseCase<List<MovieInfo>, GetTrendingListParams> {
  final HomeRepository homeRepository;

  GetTrendingListUC({required this.homeRepository});

  @override
  EitherDynamic<List<MovieInfo>> call(GetTrendingListParams params) {
    return homeRepository.getTrendingList(params);
  }
}

class GetTrendingListParams {
  final String type;

  GetTrendingListParams({required this.type});
}
