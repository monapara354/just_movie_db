import 'package:get/get.dart';
import 'package:just_movie/features/home/data/repositories/home_repository_impl.dart';
import 'package:just_movie/features/home/domain/repositories/home_repository.dart';

class InjectionRepositories {
  InjectionRepositories.inject() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: Get.find()),
      fenix: true,
    );
  }
}
