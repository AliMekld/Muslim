import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:muslim/models/surah_model.dart';
part 'quran_model.g.dart';

@CopyWith(skipFields: true)
@JsonSerializable()
class QuranModel {
  final List<SurahModel> surahs;
  final dynamic edition;

  QuranModel({this.surahs = const [], this.edition});
  factory QuranModel.fromJson(Map<String, dynamic> json) =>
      _$QuranModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuranModelToJson(this);
}
