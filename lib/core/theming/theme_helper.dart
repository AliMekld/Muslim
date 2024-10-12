import 'package:flutter/cupertino.dart';
import 'package:muslim/core/theming/theme_model.dart';
import 'package:muslim/core/theming/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemePalette extends ThemeModel {
  /// inherted widget to get currnet app theme based on brightness
   static ThemeModel of(BuildContext context) =>
      Provider.of<ThemeProvider>(context).appTheme;

  ///==============================>>[dark_palette]<<=================================///
  ThemePalette.dark({
    super.isDark = true,
    super.primaryColor = const Color(0xff025E06),       // Deep Emerald Green (Spiritual & Elegant)
    super.secondaryColor = const Color(0xffA78F66),     // Muted Gold (Traditional Accent)
    super.backgroundColor = const Color(0xff121212),    // Dark Charcoal (Dark Mode Background)
    super.surfaceColor = const Color(0xff1E1E1E),       // Darker Surface (Less Bright)
    super.primaryTextColor = const Color(0xffE0E0E0),   // Light Gray (Text Contrast)
    super.secondaryTextColor = const Color(0xffA0A0A0), // Soft Gray (Subtle Text)
    super.errorColor = const Color(0xffCF6679),         // Soft Red (For Errors)
    super.buttonColor = const Color(0xff03DAC5),        // Teal (Button Highlight)
    super.buttonDisabledColor = const Color(0xff3E3E3E),// Darker Gray (Disabled Button)
    super.dividerColor = const Color(0xff282828),       // Dark Divider Color
    super.iconColor = const Color(0xffA0A0A0),          // Gray (Icons)
    super.successColor = const Color(0xff00C853),       // Bright Green (Success)
    super.watingColor = const Color(0xffFFD600),       // Golden Yellow (Pending Actions)
});

  ///==============================>>[dark_palette]<<=================================///
 ThemePalette.light({
    super.isDark = false,
    super.primaryColor = const Color(0xff046307),       // Bright Green (Nature & Calm)
    super.secondaryColor = const Color(0xffD1B894),     // Warm Beige (Soothing Accent)
    super.backgroundColor = const Color(0xffFDFDFD),    // Soft White (Bright Background)
    super.surfaceColor = const Color(0xffffffff),       // Pure White (Surface)
    super.primaryTextColor = const Color(0xff000000),   // Black (Text Clarity)
    super.secondaryTextColor = const Color(0xff757575), // Gray (Subtle Text)
    super.errorColor = const Color(0xffB00020),         // Deep Red (For Errors)
    super.buttonColor = const Color(0xff6200EE),        // Vivid Purple (Button Color)
    super.buttonDisabledColor = const Color(0xffBDBDBD),// Light Gray (Disabled Button)
    super.dividerColor = const Color(0xffBDBDBD),       // Soft Divider Color
    super.iconColor = const Color(0xff757575),          // Gray (Icons)
    super.successColor = const Color(0xff4CAF50),       // Green (Success)
    super.watingColor = const Color(0xffFFC107),       // Yellow (Pending Actions)
});
}
