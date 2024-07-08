import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/gen/colors.gen.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

// ignore: must_be_immutable
class BusinessCategoryWidget extends StatelessWidget {
  String imagePath;
  String name;
  BusinessCategoryWidget(
      {super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      height: 56.h,
      width: 160.w,
      decoration: BoxDecoration(
          color: AppColors.secoundaryColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imagePath),
            height: 32.h,
            width: 32.w,
          ),
          UIHelper.horizontalSpace(8.w),
          Text(
            name,
            style: TextFontStyle.headline16cDFE1E6Poppins300
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
