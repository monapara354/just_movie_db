import "dart:convert";

import "package:just_movie/features/home/domain/entities/tv_info.dart";

TvInfo tvInfoFromJson(String str) => TvInfoModel.fromJson(json.decode(str));


class TvInfoModel extends TvInfo {
  TvInfoModel({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory TvInfoModel.fromJson(Map<String, dynamic> json) {
    return TvInfoModel(
      page: json["page"],
      results: json["results"] == null
          ? []
          : List<TvResult>.from(
              json["results"]!.map((x) => TvResultModel.fromJson(x)),),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "page": page,
  //       "results": results == null
  //           ? []
  //           : List<dynamic>.from(results!.map((x) => x.toJson())),
  //       "total_pages": totalPages,
  //       "total_results": totalResults,
  //     };
}

class TvResultModel extends TvResult {
  TvResultModel({
    super.adult,
    super.backdropPath,
    super.firstAirDate,
    super.genreIds,
    super.id,
    super.mediaType,
    super.name,
    super.originCountry,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
  });

  factory TvResultModel.fromJson(Map<String, dynamic> json) => TvResultModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        adult: json["adult"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "name": name,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "adult": adult,
        "original_language": originalLanguage,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
}
