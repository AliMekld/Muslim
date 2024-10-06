import 'package:flutter/material.dart';

class ThemeModel extends ThemeExtension<ThemeModel> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;

  ThemeModel({this.primaryColor, this.secondaryColor, this.backgroundColor});

  ThemeModel.light({
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
  });

  ThemeModel.dark({
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
  });
  @override
  ThemeExtension<ThemeModel> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
  }) {
    return ThemeModel(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<ThemeModel> lerp(
      covariant ThemeExtension<ThemeModel>? other, double t) {
    if (other is! ThemeModel) return this;
    return other;
  }
}
