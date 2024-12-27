import 'package:just_movie/core/utils/generic_typedefs.dart';
import 'package:just_movie/features/home/data/model/tv_info_model.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_tv.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

abstract class HomeRepository {
  EitherDynamic<List<MovieInfo>> getMovieList(
    GetMovieListParams getMovieListParams,
  );
  EitherDynamic<List<MovieInfo>> getTrendingList(
    GetTrendingListParams getTrendingListParams,
  );

  EitherDynamic<TvInfoModel> getTrendingTvList();

  EitherDynamic<TvInfoModel> getTvList(GetTvListParams getTvListParams);
}
