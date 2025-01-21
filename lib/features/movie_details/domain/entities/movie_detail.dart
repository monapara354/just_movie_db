import "package:just_movie/features/movie_details/data/model/movie_detail_model.dart";

class MovieDetail {

  MovieDetail({
     this.adult,
     this.backdropPath,
     this.belongsToCollection,
     this.budget,
     this.genres,
     this.homepage,
     this.id,
     this.imdbId,
     this.originCountry,
     this.originalLanguage,
     this.originalTitle,
     this.overview,
     this.popularity,
     this.posterPath,
     this.productionCompanies,
     this.productionCountries,
     this.releaseDate,
     this.revenue,
     this.runtime,
     this.spokenLanguages,
     this.status,
     this.tagline,
     this.title,
     this.video,
     this.voteAverage,
     this.voteCount,
  });
  bool? adult;
  String? backdropPath;
  BelongsToCollectionModel? belongsToCollection;
  int? budget;
  List<GenreModel>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanyModel>? productionCompanies;
  List<ProductionCountryModel>? productionCountries;
  DateTime? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguageModel>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
}

class BelongsToCollection {

  BelongsToCollection({
     this.id,
     this.name,
     this.posterPath,
     this.backdropPath,
  });
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;
}

class Genre {

  Genre({
    required this.id,
    required this.name,
  });
  int id;
  String name;
}

class ProductionCompany {

  ProductionCompany({
     this.id,
     this.logoPath,
     this.name,
     this.originCountry,
  });
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;
}

class ProductionCountry {

  ProductionCountry({
     this.iso31661,
     this.name,
  });
  String? iso31661;
  String? name;
}

class SpokenLanguage {

  SpokenLanguage({
     this.englishName,
     this.iso6391,
     this.name,
  });
  String? englishName;
  String? iso6391;
  String? name;
}
