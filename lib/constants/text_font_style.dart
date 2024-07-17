import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/gen/fonts.gen.dart';
import '../gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();
  //new
  static final headline32FFFFFFRoboto500 = TextStyle(
      fontFamily: FontFamily.roboto,
      color: AppColors.white,
      fontSize: 32.sp,
      fontWeight: FontWeight.w500);
  static final headline20cDFE1E6Poppins500 = TextStyle(
      fontFamily: FontFamily.poppins,
      color: AppColors.cDFE1E6,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500);
  static final headline16cDFE1E6Poppins300 = TextStyle(
      fontFamily: FontFamily.poppins,
      color: AppColors.cDFE1E6,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300);
  static final button16primaryPoppins600 = TextStyle(
      fontFamily: FontFamily.poppins,
      color: AppColors.allPrimaryColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);
  static final title14whitePoppins400 = TextStyle(
      fontFamily: FontFamily.poppins,
      color: AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400);
  static final title14cA5ADBAPoppins400 = TextStyle(
      fontFamily: FontFamily.poppins,
      color: AppColors.cA5ADBA,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400);
  static final title28cA5ADBALobster700 = TextStyle(
      fontFamily: FontFamily.lobster,
      color: AppColors.cFFFFFF,
      fontSize: 28.sp,
      fontWeight: FontWeight.w700);

  //old
}
