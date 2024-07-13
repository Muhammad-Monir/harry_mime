import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/common_widgets/auth_button.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/helpers/all_routes.dart';
import 'package:harry_mine/helpers/navigation_service.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.allPrimaryColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.splashScreen.path),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelper.verticalSpace(30.h),
                    Image.asset(
                      Assets.images.splashVector.path,
                      height: 286.h,
                      width: 318.w,
                    ),
                    UIHelper.verticalSpaceLarge,
                    Text(
                      "Business Ideas Generator",
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline32FFFFFFRoboto500,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text(
                      "Discover innovative concepts, explore new industries, and embark on your journey to success.",
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline16cDFE1E6Poppins300,
                    ),
                    UIHelper.verticalSpaceLarge,
                    AuthCustomeButton(
                      name: "GET STARTED",
                      onCallBack: () {
                        NavigationService.navigateToReplacement(Routes.home);
                      },
                      height: 56.h,
                      minWidth: 343.w,
                      borderRadius: 50.r,
                      color: Colors.transparent,
                      textStyle: TextFontStyle.button16primaryPoppins600,
                      context: context,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFB7CEEE),
                          Color(0xFF4C6794),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
