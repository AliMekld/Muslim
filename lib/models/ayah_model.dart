import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ayah_model.g.dart';

@CopyWith(skipFields: true)
@JsonSerializable()
class AyahModel {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  AyahModel({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });
  factory AyahModel.fromJson(Map<String, dynamic> json) => _$AyahModelFromJson(json);
  Map<String, dynamic> toJson() => _$AyahModelToJson(this);
}
