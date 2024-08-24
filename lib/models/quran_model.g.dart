// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QuranModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// QuranModel(...).copyWith(id: 12, name: "My name")
  /// ````
  QuranModel call({
    dynamic? edition,
    List<SurahModel>? surahs,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuranModel.copyWith(...)`.
class _$QuranModelCWProxyImpl implements _$QuranModelCWProxy {
  final QuranModel _value;

  const _$QuranModelCWProxyImpl(this._value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// QuranModel(...).copyWith(id: 12, name: "My name")
  /// ````
  QuranModel call({
    Object? edition = const $CopyWithPlaceholder(),
    Object? surahs = const $CopyWithPlaceholder(),
  }) {
    return QuranModel(
      edition: edition == const $CopyWithPlaceholder() || edition == null
          ? _value.edition
          // ignore: cast_nullable_to_non_nullable
          : edition as dynamic,
      surahs: surahs == const $CopyWithPlaceholder() || surahs == null
          ? _value.surahs
          // ignore: cast_nullable_to_non_nullable
          : surahs as List<SurahModel>,
    );
  }
}

extension $QuranModelCopyWith on QuranModel {
  /// Returns a callable class that can be used as follows: `instanceOfQuranModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$QuranModelCWProxy get copyWith => _$QuranModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranModel _$QuranModelFromJson(Map<String, dynamic> json) => QuranModel(
      surahs: (json['surahs'] as List<dynamic>?)
              ?.map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      edition: json['edition'],
    );

Map<String, dynamic> _$QuranModelToJson(QuranModel instance) =>
    <String, dynamic>{
      'surahs': instance.surahs,
      'edition': instance.edition,
    };
