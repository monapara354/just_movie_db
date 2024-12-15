import 'package:just_movie/core/utils/generic_typedefs.dart';

abstract class UseCase<T, NoParams> {
  EitherDynamic<T> call(NoParams params);
}

class NoParams {}
