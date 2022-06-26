
import 'package:json_annotation/json_annotation.dart';
import 'package:teste_flutter/models/belongs_to_collection_model.dart';
import 'package:teste_flutter/models/genre_model.dart';
import 'package:teste_flutter/models/production_company_model.dart';
import 'package:teste_flutter/models/production_country_model.dart';
import 'package:teste_flutter/models/spoken_language_model.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetail{
  late bool adult;
  late String backdropPath;
  late BelongsToCollection belongsToCollection;
  late int budget;
  late List<Genre> genres;
  late String homepage;
  late int id;
  late String imdbId;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late List<ProductionCompany> productionCompanies;
  late List<ProductionCountry> productionCountries;
  late DateTime releaseDate;
  late int revenue;
  late int runtime;
  late List<SpokenLanguage> spokenLanguages;
  late String status;
  late String tagline;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;

  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail.padrao();

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

}