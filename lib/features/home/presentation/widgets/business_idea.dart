import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';

class BusinessIdeaDeatilsWidget extends StatelessWidget {
  String imagePath;
  String name;
  Color custColor;
  BusinessIdeaDeatilsWidget(
      {super.key,
      required this.name,
      required this.imagePath,
      this.custColor = AppColors.cF404754});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.allPrimaryColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 32,
              ),
              UIHelper.horizontalSpace(14.w),
              Text(
                name,
                style: TextFontStyle.headline16cDFE1E6Poppins300
                    .copyWith(fontSize: 14.sp, color: custColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
