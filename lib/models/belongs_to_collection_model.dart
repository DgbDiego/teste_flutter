import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection_model.g.dart';

@JsonSerializable()
class BelongsToCollection {

  late int id;
  late String name;
  late String poster_path;
  late String backdrop_path;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.poster_path,
    required this.backdrop_path,
  });

  BelongsToCollection.padrao();

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}