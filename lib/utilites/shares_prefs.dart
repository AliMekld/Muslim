import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:muslim/core/theming/theme_model.dart';
import 'package:muslim/utilites/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharesPrefs {
  SharesPrefs._();

  ///=================================<<[locator]>>================================================///
  static SharedPreferences prefs = GetLocator.locator.get<SharedPreferences>();

  ///===================================<<[keys]>>=================================================///
  static const String _theme = 'theme';
  static const String _lang = 'lang';
  static const String _font = 'font';

  ///=================================<<[Setters]>>==========================================================///
  ///-------------- set theme 
  static void setTheme(ThemeModel theme) {
    if (jsonEncode(theme.toJson()).isNotEmpty) {
      prefs.setString(_theme, jsonEncode(theme.toJson()));
    } else {
      debugPrint("error in saving theme !!!");
    }
  }

  ///=================================<<[gettters]>>==========================================================///
  ///-------------- get theme
  static ThemeModel? getTheme() {
    try {
      String? themeString = prefs.getString(_theme);
      if (themeString == null || themeString.isEmpty) {
        return null;
      }
      Map<String, dynamic> json = jsonDecode(themeString);
      return ThemeModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
