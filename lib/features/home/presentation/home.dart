import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/features/home/presentation/widgets/business_idea.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:harry_mine/helpers/navigation_service.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';

import '../../../helpers/all_routes.dart';
import 'widgets/business_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.allPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(24.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: Image(image: AssetImage(Assets.icons.logo.path)),
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),
                  Text(
                    'Grow Your Business',
                    style: TextFontStyle.headline32FFFFFFRoboto500
                        .copyWith(fontSize: 20.sp),
                  ),
                  UIHelper.verticalSpace(24.h),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 8.h,
                    spacing: 8.w,
                    children: [
                      BusinessCategoryWidget(
                        name: 'Technology',
                        imagePath: Assets.icons.technology.path,
                      ),
                      BusinessCategoryWidget(
                        name: 'Finance',
                        imagePath: Assets.icons.finance.path,
                      ),
                      BusinessCategoryWidget(
                        name: 'Health',
                        imagePath: Assets.icons.health.path,
                      ),
                      BusinessCategoryWidget(
                        name: 'Services',
                        imagePath: Assets.icons.services.path,
                      ),
                      BusinessCategoryWidget(
                        name: 'Random',
                        imagePath: Assets.icons.random.path,
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Creative Business Ideas',
                        style: TextFontStyle.headline32FFFFFFRoboto500
                            .copyWith(fontSize: 20.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.savedIdeas);
                        },
                        child: Text(
                          'View All',
                          style: TextFontStyle.headline32FFFFFFRoboto500
                              .copyWith(
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(24.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.containerColor,
                        ),
                        color: AppColors.secoundaryColor),
                    child: Column(
                      children: [
                        BusinessIdeaDeatilsWidget(
                          name: 'Name',
                          imagePath: Assets.icons.user.path,
                        ),
                        UIHelper.verticalSpace(8.h),
                        BusinessIdeaDeatilsWidget(
                          name: 'Capital',
                          imagePath: Assets.icons.capital.path,
                        ),
                        UIHelper.verticalSpace(8.h),
                        BusinessIdeaDeatilsWidget(
                          name: 'Skills',
                          imagePath: Assets.icons.skills.path,
                        ),
                        UIHelper.verticalSpace(8.h),
                        BusinessIdeaDeatilsWidget(
                          name: 'Necessary People',
                          imagePath: Assets.icons.people.path,
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          Assets.icons.save.path,
                        ),
                        height: 52.h,
                        width: 52.w,
                      ),
                      Image(
                        image: AssetImage(Assets.icons.forward.path),
                        height: 52.h,
                        width: 52.w,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
