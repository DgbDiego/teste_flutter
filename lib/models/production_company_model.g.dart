// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return ProductionCompany(
    id: json['id'] as int,
    logoPath: json['logoPath'] as String,
    name: json['name'] as String,
    originCountry: json['originCountry'] as String,
  );
}

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };
