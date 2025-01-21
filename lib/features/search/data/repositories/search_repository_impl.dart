import "package:dartz/dartz.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/shared/domain/error/exception.dart";
import "package:just_movie/core/shared/domain/error/failure.dart";
import "package:just_movie/core/shared/presentaion/controller/check_internet_controller.dart";
import "package:just_movie/core/utils/generic_typedefs.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/search/data/datasource/search_datasource.dart";
import "package:just_movie/features/search/domain/repositories/search_repository.dart";
import "package:just_movie/features/search/domain/usecases/search_movie.dart";

class SearchRepositoryImpl implements SearchRepository {

  SearchRepositoryImpl({required this.searchDatasource});
  final SearchDatasource searchDatasource;

  final checkInternetController = Get.find<CheckInternetController>();

  @override
  EitherDynamic<List<MovieResult>> searchMovieList(
    SearchListParams searchListParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await searchDatasource.searchMovieList(searchListParams);
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.error));
      }
    } else {
      return Left(
        GeneralFailure(
          errorMessage: StringConstants.strPleaseCheckInternetConnection,
        ),
      );
    }
  }

  @override
  EitherDynamic<List<TvResult>> searchTvList(
    SearchListParams searchListParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await searchDatasource.searchTvList(searchListParams);
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.error));
      }
    } else {
      return Left(
        GeneralFailure(
          errorMessage: StringConstants.strPleaseCheckInternetConnection,
        ),
      );
    }
  }

  @override
  EitherDynamic<List<Cast>> searchPersonList(
    SearchListParams searchListParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await searchDatasource.searchPersonList(searchListParams);
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.error));
      }
    } else {
      return Left(
        GeneralFailure(
          errorMessage: StringConstants.strPleaseCheckInternetConnection,
        ),
      );
    }
  }
}
