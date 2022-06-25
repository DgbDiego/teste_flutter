import 'package:json_annotation/json_annotation.dart';

part 'movie_result_model.g.dart';

@JsonSerializable()
class MovieResult{
  late bool adult;
  late String backdrop_path;
  late List<int> genre_ids;
  late int id;
  late String original_language;
  late String original_title;
  late String overview;
  late double popularity;
  late String poster_path;
  late String date;
  late String title;
  late bool video;
  late double vote_average;
  late double vote_count;

  MovieResult({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count
  });

  MovieResult.padrao();

  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultToJson(this);


}