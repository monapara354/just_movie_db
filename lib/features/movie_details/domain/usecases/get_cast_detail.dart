import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart";

class GetCastDetailUC extends UseCase<CastCrew, GetCastDetailParams> {

  GetCastDetailUC({required this.movieDetailRepository});
  final MovieDetailRepository movieDetailRepository;
  @override
  EitherDynamic<CastCrew> call(GetCastDetailParams params) {
    return movieDetailRepository.getCastDetail(params);
  }
}

class GetCastDetailParams {

  GetCastDetailParams({required this.refId, required this.credit});
  final int refId;
  final Credit credit;
}
