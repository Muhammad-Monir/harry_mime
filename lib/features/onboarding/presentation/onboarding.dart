import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/common_widgets/auth_button.dart';
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

               Text("Discover innovative concepts, explore new industries, and embark on your journey to success.",
               textAlign: TextAlign.center,
               style: TextFontStyle.headline16cDFE1E6Poppins,
               ),

               AuthCustomeButton(name: "GET STARTED", onCallBack: (){}, height: 20.h, minWidth: 100.w, borderRadius: 10, color: Colors.blue, textStyle: TextFontStyle.headline32FFFFFFRoboto, context: context)




            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
