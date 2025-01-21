import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/search/domain/usecases/search_movie.dart";

abstract class SearchRepository {
  EitherDynamic<List<MovieResult>> searchMovieList(
    SearchListParams searchListParams,
  );
  EitherDynamic<List<TvResult>> searchTvList(
    SearchListParams searchListParams,
  );
  EitherDynamic<List<Cast>> searchPersonList(
    SearchListParams searchListParams,
  );
}
