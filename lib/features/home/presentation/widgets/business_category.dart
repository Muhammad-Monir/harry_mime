import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

// ignore: must_be_immutable
class BusinessCategoryWidget extends StatelessWidget {
  String imagePath;
  String name;
  VoidCallback? onTap;
  bool isSelected;
  BusinessCategoryWidget(
      {super.key,
      required this.name,
      required this.imagePath,
      this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 48.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: AppColors.secoundaryColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isSelected ? Colors.white : AppColors.secoundaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imagePath,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 32.h,
              width: 32.w,
            ),

            // Image.network(
            //   height: 32.h,
            //   width: 32.w,
            //   imagePath,
            //   loadingBuilder: (context, child, loadingProgress) {
            //     if (loadingProgress == null) {
            //       return child;
            //     } else {
            //       return Center(
            //         child: CircularProgressIndicator(
            //           value: loadingProgress.expectedTotalBytes != null
            //               ? loadingProgress.cumulativeBytesLoaded /
            //                   (loadingProgress.expectedTotalBytes ?? 1)
            //               : null,
            //         ),
            //       );
            //     }
            //   },
            //   errorBuilder: (context, error, stackTrace) {
            //     return Icon(Icons.error);
            //   },
            // ),
            // Image(
            //   image: NetworkImage(imagePath),
            //   height: 32.h,
            //   width: 32.w,
            // ),
            UIHelper.horizontalSpace(8.w),
            Text(
              name,
              style: TextFontStyle.headline16cDFE1E6Poppins300
                  .copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
