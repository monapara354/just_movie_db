import "package:just_movie/core/shared/domain/usecase/usecase.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/search/domain/repositories/search_repository.dart";

class SearchMovieListUC extends UseCase<List<MovieResult>, SearchListParams> {

  SearchMovieListUC({required this.searchRepository});
  final SearchRepository searchRepository;

  @override
  EitherDynamic<List<MovieResult>> call(SearchListParams params) {
    return searchRepository.searchMovieList(params);
  }
}

class SearchListParams {

  SearchListParams({required this.searchText});
  final String searchText;
}

class SearchTvListUC extends UseCase<List<TvResult>, SearchListParams> {

  SearchTvListUC({required this.searchRepository});
  final SearchRepository searchRepository;

  @override
  EitherDynamic<List<TvResult>> call(SearchListParams params) {
    return searchRepository.searchTvList(params);
  }
}

class SearchPersonListUC extends UseCase<List<Cast>, SearchListParams> {

  SearchPersonListUC({required this.searchRepository});
  final SearchRepository searchRepository;

  @override
  EitherDynamic<List<Cast>> call(SearchListParams params) {
    return searchRepository.searchPersonList(params);
  }
}
