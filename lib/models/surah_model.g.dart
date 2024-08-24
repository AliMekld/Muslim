// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SurahModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SurahModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SurahModel call({
    String? englishName,
    String? englishNameTranslation,
    String? name,
    int? number,
    String? revelationType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSurahModel.copyWith(...)`.
class _$SurahModelCWProxyImpl implements _$SurahModelCWProxy {
  final SurahModel _value;

  const _$SurahModelCWProxyImpl(this._value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// SurahModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SurahModel call({
    Object? englishName = const $CopyWithPlaceholder(),
    Object? englishNameTranslation = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? revelationType = const $CopyWithPlaceholder(),
  }) {
    return SurahModel(
      englishName: englishName == const $CopyWithPlaceholder()
          ? _value.englishName
          // ignore: cast_nullable_to_non_nullable
          : englishName as String?,
      englishNameTranslation:
          englishNameTranslation == const $CopyWithPlaceholder()
              ? _value.englishNameTranslation
              // ignore: cast_nullable_to_non_nullable
              : englishNameTranslation as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int?,
      revelationType: revelationType == const $CopyWithPlaceholder()
          ? _value.revelationType
          // ignore: cast_nullable_to_non_nullable
          : revelationType as String?,
    );
  }
}

extension $SurahModelCopyWith on SurahModel {
  /// Returns a callable class that can be used as follows: `instanceOfSurahModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SurahModelCWProxy get copyWith => _$SurahModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
    );

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
    };
