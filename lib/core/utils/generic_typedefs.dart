import "package:dartz/dartz.dart";
import "package:just_movie/core/shared/domain/error/failure.dart";

typedef EitherDynamic<T> = Future<Either<Failure, T>>;
