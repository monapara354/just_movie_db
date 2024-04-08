import 'package:get/get.dart';
import 'package:just_movie/features/home/presentaion/pages/home_screen.dart';
import 'package:just_movie/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pageList = [
    GetPage(name: AppRoutes.initialRoute,page: HomeScreen.new),
  ];
}
