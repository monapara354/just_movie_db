import 'package:get/get.dart';
import 'package:just_movie/features/home/domain/usecases/get_now_playing_movie.dart';

class InjectionUseCases {
  InjectionUseCases.inject() {
    Get.lazyPut<GetNowPlayingMovieUC>(
      () => GetNowPlayingMovieUC(homeRepository: Get.find()),
      fenix: true,
    );
  }
}
