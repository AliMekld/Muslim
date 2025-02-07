import 'package:flutter/material.dart';
import 'package:muslim/core/theming/theme_helper.dart';
import 'package:muslim/core/theming/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel get appTheme => _appTheme;
  static ThemeModel _appTheme = ThemeModel.defultTheme;

  static ThemeData get _darkTheme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(extensions: <ThemeExtension<ThemeModel>>[_appTheme]);
  static ThemeData get _lightTheme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(extensions: <ThemeExtension<ThemeModel>>[_appTheme]);

  ThemeData themeData = _appTheme.isDark ? _darkTheme : _lightTheme;
  void changeTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        _appTheme = ThemePalette.dark();
      case Brightness.light:
        _appTheme = ThemePalette.light();
    }
    notifyListeners();
  }
}
