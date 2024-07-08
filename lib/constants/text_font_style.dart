import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();
  //new
  static final headline32FFFFFFRoboto = GoogleFonts.roboto(
      color: AppColors.cFFFFFF, fontSize: 32.sp, fontWeight: FontWeight.w500);
  static final headline16cDFE1E6Poppins = GoogleFonts.poppins(
      color: AppColors.cDFE1E6, fontSize: 16.sp, fontWeight: FontWeight.w300);
      static final button16primaryPoppins = GoogleFonts.poppins(
      color: AppColors.allPrimaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600);
      

  //old
}
