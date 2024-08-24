import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@CopyWith(skipFields: true)
@JsonSerializable()
class SurahModel {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;


  SurahModel({
    this.number,
    this.name,
    this.englishName,
    // this.ayahs = const [],
    this.englishNameTranslation,
    this.revelationType,
  });
  factory SurahModel.fromJson(Map<String, dynamic> json) => _$SurahModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}
