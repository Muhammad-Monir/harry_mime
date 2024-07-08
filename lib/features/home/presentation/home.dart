import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.allPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    child: Image(image: AssetImage(Assets.icons.logo.path)),
                  ),
                ),
                Text('Grow Your Business'),
                Wrap(
                  children: [Container()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Creative Business Ideas'),
                    Text('Saved'),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(Assets.icons.user.path),
                              height: 32,
                            ),
                            Text(
                              'Name',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage(
                        Assets.icons.save.path,
                      ),
                      height: 32,
                    ),
                    Image(
                      image: AssetImage(Assets.icons.save.path),
                      height: 32,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
