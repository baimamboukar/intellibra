import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intellibra/src/utils/palette.dart';

class TextStyles {
  static TextStyle get title => const TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.bold, color: Palette.primary);
  static TextStyle get body => const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.normal, color: Palette.light);
  static TextStyle get myProfile => GoogleFonts.roboto(
        fontSize: 15.sp,
        color: Palette.primary,
      );
  static TextStyle get unSelectedCategory => myProfile.copyWith(color: Palette.secondary);
  static TextStyle get selectedCategory => myProfile.copyWith(color: Palette.light);
  static TextStyle get awarenessTitle => GoogleFonts.roboto(
        fontSize: 20.sp,
        color: Palette.primary,
        fontWeight: FontWeight.w500,
        // height: 24.h
      );
static TextStyle get awarenessSubTitle => GoogleFonts.roboto(
  color: Palette.primary.withOpacity(0.6),
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
  // height: 22.h,
);
static TextStyle get awarenessBody => GoogleFonts.roboto(
  color: Palette.darkGrey,
  fontWeight: FontWeight.w400,
  fontSize: 17.sp,
  // height: 22.h,
);
static TextStyle get awarenessFooter => GoogleFonts.roboto(
  color: Palette.primary.withOpacity(0.4),
  fontWeight: FontWeight.w400,
  fontSize: 12.sp,
  // height: 22.h, 
);



  static TextStyle designText(
          {required bool bold, required double size, Color? color}) =>
      TextStyle(
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color ?? Palette.primary);
}
