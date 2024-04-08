import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/domain/usecase/usecase.dart';
import 'package:just_movie/features/home/domain/usecases/get_now_playing_movie.dart';

class HomeController extends GetxController {

  HomeController({required this.getNowPlayingMovieUC});
  final GetNowPlayingMovieUC getNowPlayingMovieUC;

  List moviesList = [
    {
      'id': 1,
      'title': '100 Years at the time of',
      'url':
          'https://m.media-amazon.com/images/M/MV5BMWY3YWY1OTktNjc3Ni00NThiLWI0ODYtOTNjM2E4YjQ2MmJkXkEyXkFqcGdeQXVyMjcyMzI2OTQ@._V1_.jpg'
    },
    {
      'id': 2,
      'title': 'Avatar',
      'url':
          'https://m.media-amazon.com/images/M/MV5BNmM1NmY4N2QtNmVkOS00MjMyLWI5ZGUtYWYxMDRjY2MzNDdiXkEyXkFqcGdeQXVyMTAwMDAwMA@@._V1_.jpg'
    },
    {
      'id': 3,
      'title': '100 Years',
      'url':
          'https://m.media-amazon.com/images/M/MV5BMWY3YWY1OTktNjc3Ni00NThiLWI0ODYtOTNjM2E4YjQ2MmJkXkEyXkFqcGdeQXVyMjcyMzI2OTQ@._V1_.jpg'
    },
    {
      'id': 4,
      'title': 'Avatar 4',
      'url':
          'https://m.media-amazon.com/images/M/MV5BNmM1NmY4N2QtNmVkOS00MjMyLWI5ZGUtYWYxMDRjY2MzNDdiXkEyXkFqcGdeQXVyMTAwMDAwMA@@._V1_.jpg'
    },
  ];


  Future<void> getNowPlayingMovie() async {
    final getNowPlayingFailedOrSuccess = await getNowPlayingMovieUC(NoParams());
    getNowPlayingFailedOrSuccess.fold((l) {
      print('error');
    }, (r){
      print('object------${r.length}');
    });
  }




  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'c37e879922024e7b447766addfb964a2';
  final dio = Dio();


  Future<void> getMovues() async {
    final url = '$baseUrl/movie/now_playing?api_key=$apiKey';
    final response = await dio.get(url);
    final data = response.data;
    //jsonDecode(response.data.toString());
   // final data =jsonDecode(data2);

    if (response.statusCode == 200) {
      print('00000000%$data');
     // List aaa = data['results'];
      print(data['results']);
      for(var i in data['results'] as List){
        print(i);
      }
     // return data['results'];
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   getNowPlayingMovie();
  }







}
