import 'package:json_annotation/json_annotation.dart';

part 'production_country_model.g.dart';

@JsonSerializable()
class ProductionCountry {
  late String iso_3166_1;
  late String name;

  ProductionCountry({
    required this.iso_3166_1,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);


  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}