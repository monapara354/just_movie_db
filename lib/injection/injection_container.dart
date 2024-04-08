import 'package:just_movie/injection/injection_controller.dart';
import 'package:just_movie/injection/injection_datasource.dart';
import 'package:just_movie/injection/injection_repositories.dart';
import 'package:just_movie/injection/injection_usecases.dart';

void init(){

  InjectionDataSource.inject();
  InjectionRepositories.inject();
  InjectionUseCases.inject();
  InjectionController.inject();
}