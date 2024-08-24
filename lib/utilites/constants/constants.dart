
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Constants {
  Constants._();
  static final BorderRadius kBorderRadius16 = BorderRadius.circular(16.r);
  static final BorderRadius kBorderRadius24 = BorderRadius.circular(24.r);
  static final BorderRadius kBorderRadius8 = BorderRadius.circular(8.r);
  static final double kPadding24 = 8.r;
  static final double kPadding16 = 16.r;
  static final double kPadding8 = 24.r;
  //-
  static const double smallScreenMaxHeight = 768;
  static const double mediumScreenMaxHeight = 1200;
  // static BoxBorder kBorder(BuildContext context) => Border.all(color: ThemeHelper.of(context).textColorSecondary);
  // static const double largeScreenMaxHeight = 1200+1;

  // static LinearGradient kLinearGradiant(BuildContext context) => LinearGradient(
  //   colors: [
  //     ThemeHelper.of(context).success.withOpacity(0.2),
  //     ThemeHelper.of(context).secondary.withOpacity(0.2),
  //     ThemeHelper.of(context).cancel.withOpacity(0.2)
  //   ],
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  // );
  // static List<BoxShadow> kShadow(BuildContext context, {Color? color}) => [
  //   BoxShadow(color: color ?? ThemeHelper.of(context).medGrey, spreadRadius: 0.5, blurRadius: 0.5),
  // ];

//   static BoxDecoration defaultDecoration(BuildContext context, {bool? withGradiant, Color? color}) => BoxDecoration(
//       borderRadius: kBorderRadius16,
//       gradient: withGradiant == true ? kLinearGradiant(context) : null,
//       color: color ?? Colors.white,
//       boxShadow: withGradiant == null ? kShadow(context) : null);
}
