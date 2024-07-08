import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();
  //new
  static final headline32FFFFFFRoboto500 = GoogleFonts.roboto(
      color: AppColors.cFFFFFF, fontSize: 32.sp, fontWeight: FontWeight.w500);
  static final headline20cDFE1E6Poppins500 = GoogleFonts.roboto(
      color: AppColors.cDFE1E6, fontSize: 20.sp, fontWeight: FontWeight.w500);
  static final headline16cDFE1E6Poppins300 = GoogleFonts.poppins(
      color: AppColors.cDFE1E6, fontSize: 16.sp, fontWeight: FontWeight.w300);
  static final button16primaryPoppins600 = GoogleFonts.poppins(
      color: AppColors.allPrimaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600);
  static final title14cFFFFFFPoppins400 = GoogleFonts.poppins(
      color: AppColors.cFFFFFF, fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final title14cA5ADBAPoppins400 = GoogleFonts.poppins(
      color: AppColors.cA5ADBA, fontSize: 14.sp, fontWeight: FontWeight.w400);

  //old
}
