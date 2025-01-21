import "package:just_movie/features/home/domain/entities/movie_info.dart";

class MovieInfoModel extends MovieInfo {
  MovieInfoModel({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) => MovieInfoModel(
        page: json["page"],
        results: List<MovieResult>.from(
            json["results"].map((x) => MovieResultModel.fromJson(x)),),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  // Map<String, dynamic> toJson() => {
  //       "page": page,
  //       "results": List<MovieResultModel>.from(results.map((x) => x.toJson())),
  //       "total_pages": totalPages,
  //       "total_results": totalResults,
  //     };
}

class MovieResultModel extends MovieResult {
  MovieResultModel({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  MovieResultModel.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds =
        json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) {
      data["genre_ids"] = genreIds;
    }
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
