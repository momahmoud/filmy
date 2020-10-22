import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:filmy/common/extensions/size_extensions.dart';

class ThemeText {
  

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6.copyWith(
    fontSize: Sizes.dimen_20.sp,
    color: Colors.white,
  );
  static TextStyle get whiteHeadline => _poppinsTextTheme.headline5.copyWith(
    fontSize: Sizes.dimen_24.sp,
    color: Colors.white,
  );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1.copyWith(
    fontSize: Sizes.dimen_14.sp,
    color: Colors.white,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5,
  );
  static TextStyle get whiteBodyText2=> _poppinsTextTheme.bodyText2.copyWith(
    fontSize: Sizes.dimen_16.sp,
    color: Colors.white,
  );
  static TextStyle get whiteButton=> _poppinsTextTheme.button.copyWith(
    fontSize: Sizes.dimen_14.sp,
    color: Colors.white,
  );
  static getTextTheme() => TextTheme(
    headline5: whiteHeadline,
    headline6: _whiteHeadline6,
    subtitle1: whiteSubtitle1,
    bodyText2: whiteBodyText2,
    button: whiteButton
  );
}

extension ThemeTextExtension on TextTheme{
  TextStyle get blueSubtitle1 => subtitle1.copyWith(
    color: AppColors.blueColor,
    fontWeight: FontWeight.w600,
  );
}