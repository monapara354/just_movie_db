import 'package:get/get.dart';
import 'package:just_movie/features/home/presentaion/controller/home_controller.dart';

class InjectionController{
  InjectionController.inject(){
    Get.put(
      HomeController(getNowPlayingMovieUC: Get.find()),
      permanent: true,
    );
  }
}