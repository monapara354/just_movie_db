import 'package:just_movie/core/constants/value.dart';

class ApiUrl {
  static const movie = "movie/";
  static const trendingMovie = "trending/movie/day/";
  static const credits = "/credits";
  static const person = "person/";
  static const movieCredits = "/movie_credits";
}

class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String imageBaseUrl200 = "https://image.tmdb.org/t/p/w200";
  static const String imageBaseUrl500 = "https://image.tmdb.org/t/p/w500";
  static const String imageBaseUrl300 = "https://image.tmdb.org/t/p/w300";
  static const String accessToken = myAccessToken;
  static const String apiKey = myApiKey;
  static const String urlNowPlaying = 'now_playing';
  static const String urlUpcoming = 'upcoming';
  static const String urlPopular = 'popular';
  static const String urlTopRated = 'top_rated';
  static const String urlMovie = 'movie';
}
