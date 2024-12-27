import 'package:just_movie/features/movie_details/domain/entities/tv_detail.dart';

import 'dart:convert';

TvDetail tvDetailFromJson(String str) =>
    TvDetailModel.fromJson(json.decode(str));

// String tvDetailToJson(TvDetailModel data) => json.encode(data.toJson());

class TvDetailModel extends TvDetail {
  TvDetailModel({
    super.adult,
    super.backdropPath,
    super.createdBy,
    super.episodeRunTime,
    super.firstAirDate,
    super.genres,
    super.homepage,
    super.id,
    super.inProduction,
    super.languages,
    super.lastAirDate,
    super.lastEpisodeToAir,
    super.name,
    super.nextEpisodeToAir,
    super.networks,
    super.numberOfEpisodes,
    super.numberOfSeasons,
    super.originCountry,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.productionCompanies,
    super.productionCountries,
    super.seasons,
    super.spokenLanguages,
    super.status,
    super.tagline,
    super.type,
    super.voteAverage,
    super.voteCount,
  });

  factory TvDetailModel.fromJson(Map<String, dynamic> json) => TvDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        createdBy: json["created_by"] == null
            ? []
            : List<dynamic>.from(json["created_by"]!.map((x) => x)),
        episodeRunTime: json["episode_run_time"] == null
            ? []
            : List<dynamic>.from(json["episode_run_time"]!.map((x) => x)),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(
                json["genres"]!.map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x)),
        lastAirDate: json["last_air_date"] == null
            ? null
            : DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir: json["last_episode_to_air"] == null
            ? null
            : LastEpisodeToAirModel.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: json["networks"] == null
            ? []
            : List<Network>.from(
                json["networks"]!.map((x) => NetworkModel.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? []
            : List<Network>.from(json["production_companies"]!
                .map((x) => NetworkModel.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? []
            : List<ProductionCountry>.from(json["production_countries"]!
                .map((x) => ProductionCountryModel.fromJson(x))),
        seasons: json["seasons"] == null
            ? []
            : List<Season>.from(
                json["seasons"]!.map((x) => SeasonModel.fromJson(x))),
        spokenLanguages: json["spoken_languages"] == null
            ? []
            : List<SpokenLanguage>.from(json["spoken_languages"]!
                .map((x) => SpokenLanguageModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

//    Map<String, dynamic> toJson() => {
//         "adult": adult,
//         "backdrop_path": backdropPath,
//         "created_by": createdBy == null ? [] : List<dynamic>.from(createdBy!.map((x) => x)),
//         "episode_run_time": episodeRunTime == null ? [] : List<dynamic>.from(episodeRunTime!.map((x) => x)),
//         "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
//         "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
//         "homepage": homepage,
//         "id": id,
//         "in_production": inProduction,
//         "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
//         "last_air_date": "${lastAirDate!.year.toString().padLeft(4, '0')}-${lastAirDate!.month.toString().padLeft(2, '0')}-${lastAirDate!.day.toString().padLeft(2, '0')}",
//         "last_episode_to_air": lastEpisodeToAir?.toJson(),
//         "name": name,
//         "next_episode_to_air": nextEpisodeToAir,
//         "networks": networks == null ? [] : List<NetworkModel>.from(networks!.map((x) => x.toJson())),
//         "number_of_episodes": numberOfEpisodes,
//         "number_of_seasons": numberOfSeasons,
//         "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
//         "original_language": originalLanguage,
//         "original_name": originalName,
//         "overview": overview,
//         "popularity": popularity,
//         "poster_path": posterPath,
//         "production_companies": productionCompanies == null ? [] : List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
//         "production_countries": productionCountries == null ? [] : List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
//         "seasons": seasons == null ? [] : List<dynamic>.from(seasons!.map((x) => x.toJson())),
//         "spoken_languages": spokenLanguages == null ? [] : List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
//         "status": status,
//         "tagline": tagline,
//         "type": type,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//     };
}

class GenreModel extends Genre {
  GenreModel({
    super.id,
    super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class LastEpisodeToAirModel extends LastEpisodeToAir {
  LastEpisodeToAirModel({
    super.id,
    super.name,
    super.overview,
    super.voteAverage,
    super.voteCount,
    super.airDate,
    super.episodeNumber,
    super.episodeType,
    super.productionCode,
    super.runtime,
    super.seasonNumber,
    super.showId,
    super.stillPath,
  });

  factory LastEpisodeToAirModel.fromJson(Map<String, dynamic> json) =>
      LastEpisodeToAirModel(
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeNumber: json["episode_number"],
        episodeType: json["episode_type"],
        productionCode: json["production_code"],
        runtime: json["runtime"],
        seasonNumber: json["season_number"],
        showId: json["show_id"],
        stillPath: json["still_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "overview": overview,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "air_date":
            "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber,
        "episode_type": episodeType,
        "production_code": productionCode,
        "runtime": runtime,
        "season_number": seasonNumber,
        "show_id": showId,
        "still_path": stillPath,
      };
}

class NetworkModel extends Network {
  NetworkModel({
    super.id,
    super.logoPath,
    super.name,
    super.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({
    super.iso31661,
    super.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SeasonModel extends Season {
  SeasonModel({
    super.airDate,
    super.episodeCount,
    super.id,
    super.name,
    super.overview,
    super.posterPath,
    super.seasonNumber,
    super.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeCount: json["episode_count"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
        voteAverage: json["vote_average"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "air_date":
            "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode_count": episodeCount,
        "id": id,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "season_number": seasonNumber,
        "vote_average": voteAverage,
      };
}

class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel({
    super.englishName,
    super.iso6391,
    super.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
