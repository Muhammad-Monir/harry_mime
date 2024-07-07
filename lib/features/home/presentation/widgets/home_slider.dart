import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/helpers/navigation_service.dart';
import '/helpers/ui_helpers.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/animation_helper.dart';
import '../../model/slider.dart' as s;

class HomeSlideDemo extends StatefulWidget {
  final List<s.Slider> sliders;
  const HomeSlideDemo({super.key, required this.sliders});

  @override
  State<StatefulWidget> createState() {
    return _HomeSlideDemoState();
  }
}

class _HomeSlideDemoState extends State<HomeSlideDemo> {
  int _current = 0;

  List<String> images = [];

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final safePadding = MediaQuery.of(context).padding.top;
    final List<Widget> imageSliders = widget.sliders
        .map((item) => InkWell(
              onTap: () {
                //NavigationService.navigateToWithArgs(Routes.webview, {"name": "Detail", "url": item.link});
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
                child: SizedBox(
                  width: 1.sw,
                  // child:
                  // CachedNetworkImage(
                  //   imageUrl: item.imgFullPath!,
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) => imageSimmerCached(null),
                  //   errorWidget: (context, url, error) => imageNotFound(null),
                  // ),
                ),
              ),
            ))
        .toList();
    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        child: SizedBox(
          height: .22.sh,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                height: .6.sh,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageSliders.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              padding: EdgeInsets.all(.05.r),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.allPrimaryColor
                          : AppColors.allPrimaryColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.0),
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                width: 12.0.w,
                height: 12.0.h,
                margin:
                    EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 4.0.h),
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.allPrimaryColor
                            : AppColors.allPrimaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
