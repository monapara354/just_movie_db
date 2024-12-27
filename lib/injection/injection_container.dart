import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/services/api_service.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/model/app_config.dart';
import 'package:just_movie/core/shared/presentaion/controller/check_internet_controller.dart';
import 'package:just_movie/injection/inject/injection_controller.dart';
import 'package:just_movie/injection/inject/injection_datasource.dart';
import 'package:just_movie/injection/inject/injection_repositories.dart';
import 'package:just_movie/injection/inject/injection_usecases.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  Get
    ..put<CheckInternetController>(CheckInternetController(), permanent: true)
    ..lazyPut<AppConfig>(() => AppConfig(baseUrl: EndPoints.baseUrl),
        fenix: true)
    ..lazyPut(() => ApiService(), fenix: true);

  InjectionDataSource.inject();
  InjectionRepositories.inject();
  InjectionUseCases.inject();
  InjectionController.inject();
}
