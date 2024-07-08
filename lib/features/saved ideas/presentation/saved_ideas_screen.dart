import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/features/saved%20ideas/presentation/widgets/custom_cart.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';

class SavedIdeasScreen extends StatelessWidget {
  const SavedIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.allPrimaryColor,
        appBar: AppBar(
          toolbarHeight: 80.h,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
          leadingWidth: 40.w,
          title: Text("Save Business Ideas",
              style: TextFontStyle.headline20cDFE1E6Poppins),
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: UIHelper.kDefaulutPadding()),
              child: Image.asset(
                Assets.icons.saveFill.path,
                height: 24.h,
                width: 24.w,
              ),
            )
          ],
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) => const  CustomCart(
          name: "Technology Business",
          capital: "\$1,oo,ooo",
          skills: "Coding, JavaScript",
          employee:  "2 - 10",
        )
        
          )
        
        
        );
  }
}

