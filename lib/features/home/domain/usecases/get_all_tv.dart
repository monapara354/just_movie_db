import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/data/model/tv_info_model.dart";
import "package:just_movie/features/home/domain/repositories/home_repository.dart";

class GetTvListUC extends UseCase<TvInfoModel, GetTvListParams> {

  GetTvListUC({required this.homeRepository});
  final HomeRepository homeRepository;

  @override
  EitherDynamic<TvInfoModel> call(GetTvListParams params) {
    return homeRepository.getTvList(params);
  }
}

class GetTvListParams {

  GetTvListParams({required this.type});
  final NetworkProvider type;
}
