import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/table_constants.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/features/home/model/category_model.dart';
import 'package:harry_mine/features/home/model/idea_model.dart';
import 'package:harry_mine/features/home/presentation/widgets/business_idea.dart';
import 'package:harry_mine/features/saved%20ideas/model/business_model.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:harry_mine/helpers/db_util.dart';
import 'package:harry_mine/helpers/navigation_service.dart';
import 'package:harry_mine/helpers/toast.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';
import 'package:harry_mine/networks/api_acess.dart';
import 'package:harry_mine/networks/endpoints.dart';

import '../../../helpers/all_routes.dart';
import 'widgets/business_category.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNum = 1;

  int? currentId;
  bool isSelected = false;

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
                  // UIHelper.verticalSpace(10.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: Image(image: AssetImage(Assets.icons.logo.path)),
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'Grow Your Business',
                    style: TextFontStyle.headline32FFFFFFRoboto500
                        .copyWith(fontSize: 20.sp),
                  ),
                  UIHelper.verticalSpace(14.h),
                  Container(
                    child: StreamBuilder(
                        stream: getCategotyObj.getCategoryData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData || snapshot.data != null) {
                            CategoryModel categoryModeldata = snapshot.data;
                            return SizedBox(
                              child: Column(
                                children: [
                                  GridView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          categoryModeldata.data!.length % 2 ==
                                                  0
                                              ? categoryModeldata.data!.length
                                              : categoryModeldata.data!.length -
                                                  1,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                        mainAxisExtent: 48.h,
                                        maxCrossAxisExtent:
                                            170.w, // Maximum width of each item
                                        crossAxisSpacing: 8.w,
                                        mainAxisSpacing: 8.h,
                                        childAspectRatio: 1.0,
                                      ),
                                      itemBuilder: (context, index) {
                                        return BusinessCategoryWidget(
                                            onTap: () {
                                              currentId = categoryModeldata
                                                  .data![index].id;
                                              pageNum = 1;
                                              getIdeaRXObj.fetchIdeaData(
                                                  currentId,
                                                  pageNum: pageNum);
                                              isSelected = true;
                                              setState(() {});
                                            },
                                            isSelected: currentId == index + 1
                                                ? true
                                                : false,
                                            name: categoryModeldata
                                                .data![index].name
                                                .toString(),
                                            imagePath: url +
                                                categoryModeldata
                                                    .data![index].image
                                                    .toString());
                                      }),
                                  UIHelper.verticalSpace(8.h),
                                  if (categoryModeldata.data!.length % 2 == 1)
                                    Center(
                                      child: BusinessCategoryWidget(
                                          onTap: () {
                                            isSelected = true;
                                            setState(() {});
                                            currentId =
                                                categoryModeldata.data!.last.id;

                                            getIdeaRXObj.fetchIdeaData(
                                              currentId,
                                            );
                                          },
                                          isSelected:
                                              categoryModeldata.data!.last.id ==
                                                      currentId
                                                  ? true
                                                  : false,
                                          name: categoryModeldata
                                              .data!.last.name
                                              .toString(),
                                          imagePath: url +
                                              categoryModeldata.data!.last.image
                                                  .toString()),
                                    )
                                ],
                              ),
                            );
                            // Container(
                            //   child: Wrap(
                            //     alignment: WrapAlignment.center,
                            //     runSpacing: 8.h,
                            //     spacing: 8.w,
                            //     children: [
                            //       BusinessCategoryWidget(
                            //         name: 'Technology',
                            //         imagePath: Assets.icons.technology.path,
                            //         onTap: () {
                            //           currentId = 1;
                            //           pageNum = 1;
                            //           getIdeaRXObj.fetchIdeaData(currentId,
                            //               pageNum: pageNum);
                            //         },
                            //       ),
                            //       BusinessCategoryWidget(
                            //         name: 'Finance',
                            //         imagePath: Assets.icons.finance.path,
                            //         onTap: () {
                            //           currentId = 2;
                            //           pageNum = 1;
                            //           getIdeaRXObj.fetchIdeaData(currentId,
                            //               pageNum: pageNum);
                            //         },
                            //       ),
                            //       BusinessCategoryWidget(
                            //         name: 'Health',
                            //         imagePath: Assets.icons.health.path,
                            //         onTap: () {
                            //           currentId = 3;
                            //           pageNum = 1;
                            //           getIdeaRXObj.fetchIdeaData(currentId,
                            //               pageNum: pageNum);
                            //         },
                            //       ),
                            //       BusinessCategoryWidget(
                            //         name: 'Services',
                            //         imagePath: Assets.icons.services.path,
                            //         onTap: () {
                            //           currentId = 4;
                            //           pageNum = 1;
                            //           getIdeaRXObj.fetchIdeaData(currentId,
                            //               pageNum: pageNum);
                            //         },
                            //       ),
                            //       BusinessCategoryWidget(
                            //         name: 'Random',
                            //         imagePath: Assets.icons.random.path,
                            //       ),
                            //     ],
                            //   ),
                            // );
                          } else {
                            return SizedBox(
                              child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisExtent: 48.h,
                                    maxCrossAxisExtent:
                                        170.w, // Maximum width of each item
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    return BusinessCategoryWidget(
                                        name: 'Name',
                                        imagePath:
                                            Assets.icons.technology.path);
                                  }),
                            );
                          }
                        }),
                  ),
                  UIHelper.verticalSpace(24.h),
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
                  UIHelper.verticalSpace(12.h),
                  StreamBuilder(
                      stream: getIdeaRXObj.getIdeaData,
                      builder: (context, snapshot) {
                        //IdeaModel ideaModel = snapshot.data;
                        if (snapshot.hasData && snapshot.data != null) {
                          // IdeaModel ideaModel = snapshot.data;
                          BusinessModel businessModel = snapshot.data['data'];
                          bool hasData = snapshot.data['hasNext'];

                          return snapshot.data != null
                              ? Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                            color: AppColors.containerColor,
                                          ),
                                          color: AppColors.secoundaryColor),
                                      child: Column(
                                        children: [
                                          BusinessIdeaDeatilsWidget(
                                              name: businessModel.name,
                                              imagePath: Assets.icons.user.path,
                                              custColor: AppColors.cFFFFFF),
                                          UIHelper.verticalSpace(8.h),
                                          BusinessIdeaDeatilsWidget(
                                              name: businessModel.capital,
                                              imagePath:
                                                  Assets.icons.capital.path,
                                              custColor: AppColors.cFFFFFF),
                                          UIHelper.verticalSpace(8.h),
                                          BusinessIdeaDeatilsWidget(
                                              name: businessModel.skills,
                                              imagePath:
                                                  Assets.icons.skills.path,
                                              custColor: AppColors.cFFFFFF),
                                          UIHelper.verticalSpace(8.h),
                                          BusinessIdeaDeatilsWidget(
                                            name: businessModel.necessaryPeople,
                                            custColor: AppColors.cFFFFFF,
                                            imagePath: Assets.icons.people.path,
                                          ),
                                        ],
                                      ),
                                    ),
                                    UIHelper.verticalSpace(18.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            try {
                                              await DbUtil().saveData(
                                                  TableConstant.kSaveTableName,
                                                  BusinessModel(
                                                    uid: businessModel.uid,
                                                    categoryId: businessModel
                                                        .categoryId,
                                                    name: businessModel.name,
                                                    capital:
                                                        businessModel.capital,
                                                    skills:
                                                        businessModel.skills,
                                                    necessaryPeople:
                                                        businessModel
                                                            .necessaryPeople,
                                                  ).toJson());
                                              ToastUtil.showShortToast(
                                                  "Item Add Success");
                                            } catch (e) {
                                              rethrow;
                                            }
                                          },
                                          child: Image(
                                            image: AssetImage(
                                              Assets.icons.save.path,
                                            ),
                                            height: 44.h,
                                            width: 44.w,
                                          ),
                                        ),
                                        !hasData
                                            ? const SizedBox.shrink()
                                            : GestureDetector(
                                                onTap: () {
                                                  pageNum++;
                                                  getIdeaRXObj.fetchIdeaData(
                                                      currentId,
                                                      pageNum: pageNum);
                                                },
                                                child: Image(
                                                  image: AssetImage(Assets
                                                      .icons.forward.path),
                                                  height: 44.h,
                                                  width: 44.w,
                                                ),
                                              )
                                      ],
                                    )
                                  ],
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 60.h),
                                    child: Image(
                                      image: AssetImage(
                                          Assets.images.emptyIdea.path),
                                      height: 230.w,
                                      width: 260.h,
                                    ),
                                  ),
                                );
                        } else {
                          return Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.only(top: 60.h),
                              child: Image(
                                image: AssetImage(Assets.images.emptyIdea.path),
                                height: 230.w,
                                width: 260.h,
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
