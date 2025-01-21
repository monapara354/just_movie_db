import "package:just_movie/core/utils/generic_typedefs.dart";

// ignore: one_member_abstracts
abstract class UseCase<T, NoParams> {
  EitherDynamic<T> call(NoParams params);
}

class NoParams {}
