import 'package:flutter/material.dart';
import 'package:muslim/core/theming/theme_helper.dart';
import 'package:muslim/core/theming/theme_model.dart';
import 'package:muslim/modules/HomeScreen/home_controller.dart';

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
  void changeTheme(SystemBrightness brightness) {
    switch (brightness) {
      case SystemBrightness.dark:
        _appTheme = ThemePalette.dark();
      case SystemBrightness.light:
        _appTheme = ThemePalette.light();
    }
    print(_appTheme.toJson());
    notifyListeners();
  }
}
