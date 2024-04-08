
import 'package:dio/dio.dart';
import 'package:just_movie/core/domain/error/failure.dart';
import 'package:just_movie/features/home/data/model/movie_info_model.dart';

abstract class HomeDataSource{
  Future<List<MovieInfoModel>> getNowPlayingMovie();
}

class HomeDataSourceImpl extends HomeDataSource{

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'c37e879922024e7b447766addfb964a2';
  final dio = Dio();

  @override
  Future<List<MovieInfoModel>> getNowPlayingMovie()async {
   try{
     List<MovieInfoModel> movieList = [];

     final url = '$baseUrl/movie/now_playing?api_key=$apiKey';
     final response = await dio.get(url);
     final data = response.data;

     if (response.statusCode == 200) {
        for(var d in data['results']){
          final movie = MovieInfoModel.fromJson(d);
          movieList.add(movie);
        }
     }
     return movieList;
   }catch(e){
    throw ServerFailure(errorMessage: e.toString());
   }
  }

}