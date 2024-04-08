
import 'package:just_movie/core/domain/entity/type_def.dart';

abstract class UseCase<T,NoParams> {
  EitherDynamic<T> call(NoParams params);
}

class NoParams{

}