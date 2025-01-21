import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/data/model/tv_info_model.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/repositories/home_repository.dart";

class GetTrendingListUC extends UseCase<MovieInfo, GetTrendingListParams> {

  GetTrendingListUC({required this.homeRepository});
  final HomeRepository homeRepository;

  @override
  EitherDynamic<MovieInfo> call(GetTrendingListParams params) {
    return homeRepository.getTrendingList(params);
  }
}

class GetTrendingListParams {

  GetTrendingListParams({required this.type});
  final String type;
}

class GetTrendingTVListUC extends UseCase<TvInfoModel, NoParams> {

  GetTrendingTVListUC({required this.homeRepository});
  final HomeRepository homeRepository;

  @override
  EitherDynamic<TvInfoModel> call(NoParams params) {
    return homeRepository.getTrendingTvList();
  }
}
