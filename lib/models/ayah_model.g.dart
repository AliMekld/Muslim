// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AyahModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AyahModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AyahModel call({
    int? hizbQuarter,
    int? juz,
    int? manzil,
    int? number,
    int? numberInSurah,
    int? page,
    int? ruku,
    bool? sajda,
    String? text,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAyahModel.copyWith(...)`.
class _$AyahModelCWProxyImpl implements _$AyahModelCWProxy {
  final AyahModel _value;

  const _$AyahModelCWProxyImpl(this._value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// AyahModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AyahModel call({
    Object? hizbQuarter = const $CopyWithPlaceholder(),
    Object? juz = const $CopyWithPlaceholder(),
    Object? manzil = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? numberInSurah = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? ruku = const $CopyWithPlaceholder(),
    Object? sajda = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return AyahModel(
      hizbQuarter: hizbQuarter == const $CopyWithPlaceholder()
          ? _value.hizbQuarter
          // ignore: cast_nullable_to_non_nullable
          : hizbQuarter as int?,
      juz: juz == const $CopyWithPlaceholder()
          ? _value.juz
          // ignore: cast_nullable_to_non_nullable
          : juz as int?,
      manzil: manzil == const $CopyWithPlaceholder()
          ? _value.manzil
          // ignore: cast_nullable_to_non_nullable
          : manzil as int?,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int?,
      numberInSurah: numberInSurah == const $CopyWithPlaceholder()
          ? _value.numberInSurah
          // ignore: cast_nullable_to_non_nullable
          : numberInSurah as int?,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int?,
      ruku: ruku == const $CopyWithPlaceholder()
          ? _value.ruku
          // ignore: cast_nullable_to_non_nullable
          : ruku as int?,
      sajda: sajda == const $CopyWithPlaceholder()
          ? _value.sajda
          // ignore: cast_nullable_to_non_nullable
          : sajda as bool?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
    );
  }
}

extension $AyahModelCopyWith on AyahModel {
  /// Returns a callable class that can be used as follows: `instanceOfAyahModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$AyahModelCWProxy get copyWith => _$AyahModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahModel _$AyahModelFromJson(Map<String, dynamic> json) => AyahModel(
      number: (json['number'] as num?)?.toInt(),
      text: json['text'] as String?,
      numberInSurah: (json['numberInSurah'] as num?)?.toInt(),
      juz: (json['juz'] as num?)?.toInt(),
      manzil: (json['manzil'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      ruku: (json['ruku'] as num?)?.toInt(),
      hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
      sajda: json['sajda'] as bool?,
    );

Map<String, dynamic> _$AyahModelToJson(AyahModel instance) => <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };
