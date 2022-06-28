
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class Genre {


  late int id;
  late String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre.padrao();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}