import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.splashScreen.path),
            fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric( horizontal: UIHelper.kDefaulutPadding()
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset(Assets.images.splashVector.path, height: 286.h, width: 318.w,),
            
               Text("Business Ideas Generator",
               textAlign: TextAlign.center,
               style: TextFontStyle.headline32FFFFFFRoboto,
               ),

               Text("Business Ideas Generator",
               textAlign: TextAlign.center,
               style: TextFontStyle.headline32FFFFFFRoboto,
               ),




            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
