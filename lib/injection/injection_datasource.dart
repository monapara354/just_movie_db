import 'package:get/get.dart';
import 'package:just_movie/features/home/data/datasource/home_datasource.dart';

class InjectionDataSource {
  InjectionDataSource.inject() {
    Get.lazyPut<HomeDataSource>(
      () => HomeDataSourceImpl(),
      fenix: true,
    );
  }
}
