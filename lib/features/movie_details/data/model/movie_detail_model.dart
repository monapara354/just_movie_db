import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel(
      {super.adult,
      super.backdropPath,
      super.belongsToCollection,
      super.budget,
      super.genres,
      super.homepage,
      super.id,
      super.imdbId,
      super.originCountry,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      super.productionCompanies,
      super.productionCountries,
      super.releaseDate,
      super.revenue,
      super.runtime,
      super.spokenLanguages,
      super.status,
      super.tagline,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"] != null
            ? BelongsToCollectionModel.fromJson(json["belongs_to_collection"])
            : null,
        budget: json["budget"],
        genres: json["genres"] != null
            ? List<GenreModel>.from(
                json["genres"].map((x) => GenreModel.fromJson(x)))
            : null,
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: json["origin_country"] != null
            ? List<String>.from(json["origin_country"].map((x) => x))
            : null,
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] != null
            ? List<ProductionCompanyModel>.from(json["production_companies"]
                .map((x) => ProductionCompanyModel.fromJson(x)))
            : null,
        productionCountries: json["production_countries"] != null
            ? List<ProductionCountryModel>.from(json["production_countries"]
                .map((x) => ProductionCountryModel.fromJson(x)))
            : null,
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] != null
            ? List<SpokenLanguageModel>.from(json["spoken_languages"]
                .map((x) => SpokenLanguageModel.fromJson(x)))
            : null,
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection!.toJson(),
        "budget": budget,
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class BelongsToCollectionModel extends BelongsToCollection {
  BelongsToCollectionModel(
      {super.id, super.name, super.posterPath, super.backdropPath});

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) =>
      BelongsToCollectionModel(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}

class GenreModel extends Genre {
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompanyModel extends ProductionCompany {
  ProductionCompanyModel(
      {super.id, super.logoPath, super.name, super.originCountry});

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
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
  ProductionCountryModel({super.iso31661, super.name});

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

class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel({super.englishName, super.iso6391, super.name});

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
