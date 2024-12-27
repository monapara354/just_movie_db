import 'package:just_movie/core/shared/domain/usecase/usecase.dart';
import 'package:just_movie/core/utils/generic_typedefs.dart';
import 'package:just_movie/features/movie_details/domain/entities/tv_detail.dart';
import 'package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart';

class GetTVDetailUC extends UseCase<TvDetail, GetTvDetailParams> {
  final MovieDetailRepository movieDetailRepository;

  GetTVDetailUC({required this.movieDetailRepository});

  @override
  EitherDynamic<TvDetail> call(GetTvDetailParams params) {
    return movieDetailRepository.getTvDetail(params);
  }
}

class GetTvDetailParams {
  final int refId;

  GetTvDetailParams({required this.refId});
}
