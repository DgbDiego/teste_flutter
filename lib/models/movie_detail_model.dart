
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
  late String backdrop_path;
  late BelongsToCollection? belongs_to_collection;
  late int budget;
  late List<Genre>? genres;
  late String homepage;
  late int id;
  late String imdb_id;
  late String original_language;
  late String original_title;
  late String overview;
  late double popularity;
  late String poster_path;
  late List<ProductionCompany>? production_companies;
  late List<ProductionCountry>? production_countries;
  late DateTime release_date;
  late int revenue;
  late int runtime;
  late List<SpokenLanguage>? spoken_languages;
  late String status;
  late String tagline;
  late String title;
  late bool video;
  late double vote_average;
  late int vote_count;

  MovieDetail({
    required this.adult,
    required this.backdrop_path,
    this.belongs_to_collection,
    required this.budget,
    this.genres,
    required this.homepage,
    required this.id,
    required this.imdb_id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    this.production_companies,
    this.production_countries,
    required this.release_date,
    required this.revenue,
    required this.runtime,
    this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  MovieDetail.padrao();

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

}