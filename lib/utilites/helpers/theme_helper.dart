import 'package:flutter/material.dart';
import 'package:muslim/core/theming/theme_helper.dart';

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
  final BuildContext context;
    TextStyleHelper._(this.context);
  ///-
  ///--inherted widget
 static  TextStyleHelper of(BuildContext context)=>TextStyleHelper._(context);
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
  ///GETTER FOR TEXT STYLE
   TextStyle _getTextStyle({
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: ThemePalette.of(context).primaryTextColor,
      height: 1.25,
      fontWeight: FontWeight.normal,
      fontFamily: AppFonts.sallem.name,
      fontStyle: FontStyle.normal,
    );
  }
  /// TYPO GRAPHY
   TextStyle get headerLarge48 => _getTextStyle (fontSize: 48);
   TextStyle get headerMedium34 => _getTextStyle(fontSize: 34);
   TextStyle get headerSmall24 => _getTextStyle (fontSize: 24);
   TextStyle get bodyLarge16 => _getTextStyle   (fontSize: 16);
   TextStyle get bodyMedium14 => _getTextStyle  (fontSize: 14);
   TextStyle get bodySmall12 => _getTextStyle   (fontSize: 12);
   TextStyle get label8 => _getTextStyle        (fontSize: 8);

  ///TOGGLE FONT
  void toggleFont(AppFonts font) {
    _appFont = font;
    notifyListeners();
  }



  ///Todo : fetch Font
  Future fetchFont() async {
    // await
  }
}
