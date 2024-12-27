import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/shared/domain/error/exception.dart';
import 'package:just_movie/core/shared/domain/error/failure.dart';
import 'package:just_movie/core/shared/presentaion/controller/check_internet_controller.dart';
import 'package:just_movie/core/utils/generic_typedefs.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/entities/tv_info.dart';
import 'package:just_movie/features/movie_details/data/datasource/movie_detail_datasource.dart';
import 'package:just_movie/features/movie_details/domain/entities/cast_crew.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/entities/person.dart';
import 'package:just_movie/features/movie_details/domain/entities/tv_detail.dart';
import 'package:just_movie/features/movie_details/domain/repositories/movie_detail_repository.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_cast_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_movie_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_person_detail.dart';
import 'package:just_movie/features/movie_details/domain/usecases/get_tv_detail.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDatasource movieDetailDatasource;

  MovieDetailRepositoryImpl({required this.movieDetailDatasource});

  final checkInternetController = Get.find<CheckInternetController>();
  @override
  EitherDynamic<MovieDetail> getMovieDetail(
    GetMovieDetailParams getMovieDetailParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data =
            await movieDetailDatasource.getMovieDetail(getMovieDetailParams);
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
  EitherDynamic<CastCrew> getCastDetail(
    GetCastDetailParams getCastDetailParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data =
            await movieDetailDatasource.getCastDetail(getCastDetailParams);
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
  EitherDynamic<Person> getPersonDetail(
    GetPersonDetailParams getPersonDetailParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data =
            await movieDetailDatasource.getPersonDetail(getPersonDetailParams);
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
  EitherDynamic<List<MovieInfo>> getPersonMovies(
    GetPersonDetailParams getPersonDetailParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data =
            await movieDetailDatasource.getPersonMovies(getPersonDetailParams);
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
  EitherDynamic<TvDetail> getTvDetail(
    GetTvDetailParams getTvDetailParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await movieDetailDatasource.getTvDetail(getTvDetailParams);
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
  EitherDynamic<List<TvResult>> getPersonTvShow(
    GetPersonDetailParams getPersonDetailParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data =
            await movieDetailDatasource.getPersonTvShow(getPersonDetailParams);
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
