import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/shared/domain/error/exception.dart';

import 'package:just_movie/core/shared/domain/error/failure.dart';
import 'package:just_movie/core/shared/presentaion/controller/check_internet_controller.dart';
import 'package:just_movie/core/utils/generic_typedefs.dart';

import 'package:just_movie/features/home/data/datasource/home_datasource.dart';
import 'package:just_movie/features/home/data/model/tv_info_model.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_movie.dart';
import 'package:just_movie/features/home/domain/usecases/get_all_tv.dart';
import 'package:just_movie/features/home/domain/usecases/get_tranding.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  final checkInternetController = Get.find<CheckInternetController>();

  @override
  EitherDynamic<List<MovieInfo>> getMovieList(
    GetMovieListParams getMovieListParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await homeDataSource.getMovieList(getMovieListParams);
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
  EitherDynamic<List<MovieInfo>> getTrendingList(
    GetTrendingListParams getTrendingListParams,
  ) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data =
            await homeDataSource.getTrendingList(getTrendingListParams);
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
  EitherDynamic<TvInfoModel> getTrendingTvList() async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await homeDataSource.getTrendingTvList();
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
  EitherDynamic<TvInfoModel> getTvList(GetTvListParams getTvListParams) async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await homeDataSource.getTvList(getTvListParams);
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
