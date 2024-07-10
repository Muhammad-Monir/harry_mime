import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/common_widgets/loading_indicators.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';
import 'gen/colors.gen.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.allPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(150.h),
            Image.asset(Assets.icons.logo.path, height: 100.h, width: 100.w,),
            UIHelper.verticalSpaceSmall,
            SizedBox(
                                child: shimmer(
                                    context: context,
                                    name: Assets.lottie.loadingSpinner,
                                    size: 120.sp),
                              )
          ],
        ),
      ),
    );
  }
}
