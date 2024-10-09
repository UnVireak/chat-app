import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme {
  // Define your color palette
  static const Color primaryColor = Color(0xFF0A73FF);
  static const Color secondaryColor = Color(0xFF27AE60);
  static const Color backgroundTextField = Colors.white;
  static const Color textColor = Colors.black87;

  // Define font sizes
  static const double largeFontSize = 24;
  static const double mediumFontSize = 18.0;
  static const double smallFontSize = 14.0;
  // Utility function to determine text color based on theme
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }
  static Color bgTextFieldColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xFF424242)
        : Color(0xFFE0E0E0);
  }
  static Color textFieldColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }
  // Define your TextStyles for easy access
  // static TextStyle largeFontTextStyle = TextStyle(
  //   fontSize: largeFontSize.sp,
  //   fontWeight: FontWeight.bold,
  //   // color: textColor,
  // );
  static TextStyle largeFontTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 24.sp,
      // fontWeight: FontWeight.bold,
      color: getTextColor(context),
    );
  }
  static TextStyle mediumFontTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 18.sp,
      color: getTextColor(context),
    );
  }
  static TextStyle smallFontTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp,
      color: getTextColor(context),
    );
  }

static TextStyle mediumTextStyleButton = TextStyle(
  fontSize: mediumFontSize.sp,
  fontWeight: FontWeight.normal,
  color: Colors.white,
  // color: textColor,
);


}
