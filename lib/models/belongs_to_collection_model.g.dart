// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belongs_to_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) {
  return BelongsToCollection(
    id: json['id'] as int,
    name: json['name'] as String,
    posterPath: json['posterPath'] as String,
    backdropPath: json['backdropPath'] as String,
  );
}

Map<String, dynamic> _$BelongsToCollectionToJson(
        BelongsToCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
    };
