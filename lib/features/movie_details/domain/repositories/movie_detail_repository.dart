import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/movie_details/domain/entities/movie_detail.dart";
import "package:just_movie/features/movie_details/domain/entities/person.dart";
import "package:just_movie/features/movie_details/domain/entities/tv_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_cast_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_person_detail.dart";
import "package:just_movie/features/movie_details/domain/usecases/get_tv_detail.dart";

abstract class MovieDetailRepository {
  EitherDynamic<MovieDetail> getMovieDetail(
    GetMovieDetailParams getMovieDetailParams,
  );

  EitherDynamic<CastCrew> getCastDetail(
    GetCastDetailParams getCastDetailParams,
  );

  EitherDynamic<Person> getPersonDetail(
    GetPersonDetailParams getPersonDetailParams,
  );
  EitherDynamic<List<MovieResult>> getPersonMovies(
    GetPersonDetailParams getPersonDetailParams,
  );

  EitherDynamic<TvDetail> getTvDetail(GetTvDetailParams getTvDetailParams);

  EitherDynamic<List<TvResult>> getPersonTvShow(
    GetPersonDetailParams getPersonDetailParams,
  );
}
