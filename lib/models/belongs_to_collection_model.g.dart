// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belongs_to_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) {
  return BelongsToCollection(
    id: json['id'] as int,
    name: json['name'] as String,
    poster_path: json['poster_path'] as String,
    backdrop_path: json['backdrop_path'] as String,
  );
}

Map<String, dynamic> _$BelongsToCollectionToJson(
        BelongsToCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.poster_path,
      'backdrop_path': instance.backdrop_path,
    };
