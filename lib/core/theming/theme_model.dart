// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:muslim/core/theming/theme_helper.dart';

class ThemeModel extends ThemeExtension<ThemeModel> {
  /// get defult theme from device
  static ThemeModel get defultTheme =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? ThemePalette.dark()
          : ThemePalette.light();

  final bool isDark;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color errorColor;
  final Color successColor;
  final Color watingColor;
  final Color buttonColor;
  final Color buttonDisabledColor;
  final Color dividerColor;
  final Color iconColor;

  ThemeModel({
    required this.isDark,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.buttonColor,
    required this.buttonDisabledColor,
    required this.dividerColor,
    required this.errorColor,
    required this.iconColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.successColor,
    required this.surfaceColor,
    required this.watingColor,
  });
  @override
  ThemeExtension<ThemeModel> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? errorColor,
    Color? buttonColor,
    Color? buttonDisabledColor,
    Color? dividerColor,
    Color? iconColor,
    Color? successColor,
    Color? watingColor,
  }) {
    return ThemeModel(
      isDark: isDark,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      errorColor: errorColor ?? this.errorColor,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonDisabledColor: buttonDisabledColor ?? this.buttonDisabledColor,
      dividerColor: dividerColor ?? this.dividerColor,
      iconColor: iconColor ?? this.iconColor,
      successColor: successColor ?? this.successColor,
      watingColor: watingColor ?? this.watingColor,
    );
  }

  @override
  ThemeExtension<ThemeModel> lerp(
      covariant ThemeExtension<ThemeModel>? other, double t) {
    return this;
  }

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
        isDark: json['isDark'],
        backgroundColor: json['backgroundColor'],
        primaryColor: json['primaryColor'],
        secondaryColor: json['secondaryColor'],
        buttonColor: json['buttonColor'],
        buttonDisabledColor: json['buttonDisabledColor'],
        dividerColor: json['dividerColor'],
        errorColor: json['errorColor'],
        iconColor: json['iconColor'],
        primaryTextColor: json['primaryTextColor'],
        secondaryTextColor: json['secondaryTextColor'],
        successColor: json['successColor'],
        surfaceColor: json['surfaceColor'],
        watingColor: json['watingColor'],
      );
  Map<String, dynamic> toJson() => {
        'isDark:': isDark,
        'backgroundColor': backgroundColor.value,
        'primaryColor': primaryColor.value,
        'secondaryColor': secondaryColor.value,
        'buttonColor': buttonColor.value,
        'buttonDisabledColor': buttonDisabledColor.value,
        'dividerColor': dividerColor.value,
        'errorColor': errorColor.value,
        'iconColor': iconColor.value,
        'primaryTextColor': primaryTextColor.value,
        'secondaryTextColor': secondaryTextColor.value,
        'successColor': successColor.value,
        'surfaceColor': surfaceColor.value,
        'watingColor': watingColor.value,
      };
}
