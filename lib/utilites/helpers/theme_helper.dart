import 'package:flutter/material.dart';

///-
enum AppFonts {
  soosi(fontFamilyName: "soosi"),
  sallem(fontFamilyName: "sallem"),
  naskhNastaleeq(fontFamilyName: "NaskhNastaleeq"),
  uthmanicHafs(fontFamilyName: "UthmanicHafs"),
  warsh(fontFamilyName: "warsh");

  final String fontFamilyName;

  const AppFonts({required this.fontFamilyName});
}

class TextStyleHelper extends ChangeNotifier {
  ///-
  static AppFonts _appFont = AppFonts.sallem;

  ///TODO
  _getFontStyle() {
    switch (_appFont) {
      case AppFonts.soosi:
        _appFont = AppFonts.soosi;
      case AppFonts.sallem:
        _appFont = AppFonts.sallem;
      case AppFonts.naskhNastaleeq:
        _appFont = AppFonts.naskhNastaleeq;
      case AppFonts.uthmanicHafs:
        _appFont = AppFonts.uthmanicHafs;
      case AppFonts.warsh:
        _appFont = AppFonts.warsh;
      // ignore: constant_pattern_never_matches_value_type
      case null:
        _appFont = AppFonts.soosi;
        notifyListeners();
    }
  }

  /// TYPO GRAPHY
  static TextStyle get headerLarge48 => _getTextStyle(fontSize: 48);
  static TextStyle get headerMedium34 => _getTextStyle(fontSize: 34);
  static TextStyle get headerSmall24 => _getTextStyle(fontSize: 24);

  static TextStyle get bodyLarge16 => _getTextStyle(fontSize: 16);
  static TextStyle get bodyMedium14 => _getTextStyle(fontSize: 14);
  static TextStyle get bodySmall12 => _getTextStyle(fontSize: 12);

  static TextStyle get label8 => _getTextStyle(fontSize: 8);

  ///TOGGLE FONT
  void toggleFont(AppFonts font) {
    _appFont = font;
    notifyListeners();
  }

  ///GETTER FOR TEXT STYLE
  static TextStyle _getTextStyle({
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
      height: 1.25,
      fontWeight: FontWeight.normal,
      fontFamily: AppFonts.sallem.name,
      fontStyle: FontStyle.normal,
    );
  }

  ///Todo : fetch Font
  Future fetchFont() async {
    // await
  }
}
