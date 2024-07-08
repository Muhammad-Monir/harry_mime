import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/features/saved%20ideas/presentation/widgets/saved_idea_cart_title_widget.dart';
import 'package:harry_mine/gen/assets.gen.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SavedIdeaCustomCart extends StatelessWidget {
  final String name, capital, skills, employee;
  const SavedIdeaCustomCart({
    super.key,
    required this.name,
    required this.capital,
    required this.skills,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: UIHelper.kDefaulutPadding(),
      ),
      child: Container(
        height: 112.h,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            color: AppColors.secoundaryColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(11.w),
          // padding: EdgeInsets.symmetric( horizontal: 11.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 91.h,
                width: 74.w,
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Image.asset(Assets.icons.logo.path),
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  children: [
                    SavedIdeaCartTitleWidget(
                      title: "Name",
                      details: name,
                    ),
                    SavedIdeaCartTitleWidget(
                      title: "Capital",
                      details: capital,
                    ),
                    SavedIdeaCartTitleWidget(
                      title: "Skills",
                      details: skills,
                    ),
                    SavedIdeaCartTitleWidget(
                      title: "Employee",
                      details: employee,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}