import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/table_constants.dart';
import 'package:harry_mine/constants/text_font_style.dart';
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

import '../../../helpers/all_routes.dart';
import 'widgets/business_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  int pageNum = 1;
  int? currentId;

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
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 8.h,
                    spacing: 8.w,
                    children: [
                      BusinessCategoryWidget(
                        name: 'Technology',
                        imagePath: Assets.icons.technology.path,
                        onTap: () {
                          currentId = 1;
                          pageNum = 1;
                          getIdeaRXObj.fetchIdeaData(currentId,
                              pageNum: pageNum);
                        },
                      ),
                      BusinessCategoryWidget(
                        name: 'Finance',
                        imagePath: Assets.icons.finance.path,
                        onTap: () {
                          currentId = 2;
                          pageNum = 1;
                          getIdeaRXObj.fetchIdeaData(currentId,
                              pageNum: pageNum);
                        },
                      ),
                      BusinessCategoryWidget(
                        name: 'Health',
                        imagePath: Assets.icons.health.path,
                        onTap: () {
                          currentId = 3;
                          pageNum = 1;
                          getIdeaRXObj.fetchIdeaData(currentId,
                              pageNum: pageNum);
                        },
                      ),
                      BusinessCategoryWidget(
                        name: 'Services',
                        imagePath: Assets.icons.services.path,
                        onTap: () {
                          currentId = 4;
                          pageNum = 1;
                          getIdeaRXObj.fetchIdeaData(currentId,
                              pageNum: pageNum);
                        },
                      ),
                      BusinessCategoryWidget(
                        name: 'Random',
                        imagePath: Assets.icons.random.path,
                      ),
                    ],
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
                  Container(
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10.r),
                    //     border: Border.all(
                    //       color: AppColors.containerColor,
                    //     ),
                    //     color: AppColors.secoundaryColor),
                    child: StreamBuilder(
                        stream: getIdeaRXObj.getIdeaData,
                        builder: (context, snapshot) {
                          //IdeaModel ideaModel = snapshot.data;

                          if (snapshot.hasData && snapshot.data != null) {
                            IdeaModel ideaModel = snapshot.data;

                            return ideaModel.data!.business!.data!.isNotEmpty
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
                                              name: ideaModel.data!.business!
                                                      .data!.first.name ??
                                                  'Name',
                                              imagePath: Assets.icons.user.path,
                                              custColor: ideaModel
                                                          .data!
                                                          .business!
                                                          .data!
                                                          .first
                                                          .name !=
                                                      null
                                                  ? AppColors.cFFFFFF
                                                  : AppColors.cF404754,
                                            ),
                                            UIHelper.verticalSpace(8.h),
                                            BusinessIdeaDeatilsWidget(
                                              name: ideaModel.data!.business!
                                                      .data!.first.capital ??
                                                  'Capital',
                                              imagePath:
                                                  Assets.icons.capital.path,
                                              custColor: ideaModel
                                                          .data!
                                                          .business!
                                                          .data!
                                                          .first
                                                          .capital !=
                                                      null
                                                  ? AppColors.cFFFFFF
                                                  : AppColors.cF404754,
                                            ),
                                            UIHelper.verticalSpace(8.h),
                                            BusinessIdeaDeatilsWidget(
                                              name: ideaModel.data!.business!
                                                      .data!.first.skills ??
                                                  'Skills',
                                              imagePath:
                                                  Assets.icons.skills.path,
                                              custColor: ideaModel
                                                          .data!
                                                          .business!
                                                          .data!
                                                          .first
                                                          .skills !=
                                                      null
                                                  ? AppColors.cFFFFFF
                                                  : AppColors.cF404754,
                                            ),
                                            UIHelper.verticalSpace(8.h),
                                            BusinessIdeaDeatilsWidget(
                                              name: ideaModel
                                                      .data!
                                                      .business!
                                                      .data!
                                                      .first
                                                      .necessaryPeople ??
                                                  'Necessary People',
                                              custColor: ideaModel
                                                          .data!
                                                          .business!
                                                          .data!
                                                          .first
                                                          .necessaryPeople !=
                                                      null
                                                  ? AppColors.cFFFFFF
                                                  : AppColors.cF404754,
                                              imagePath:
                                                  Assets.icons.people.path,
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

                                              try{
                                                await DbUtil().saveData(
                                                
                                                TableConstant.kSaveTableName, 
                                                BusinessModel(
                                                  uid: ideaModel.data! .business!.data! .first.id!, 
                                                  categoryId: ideaModel.data! .business!.data! .first.categoryId!, 
                                                  name: ideaModel.data! .business!.data! .first.name!, 
                                                  capital: ideaModel.data! .business!.data! .first.capital!, 
                                                  skills: ideaModel.data! .business!.data! .first.skills!, 
                                                  necessaryPeople: ideaModel.data! .business!.data! .first.necessaryPeople!
                                                  ).toJson()
                                                );
                                                ToastUtil.showShortToast("Item Add Success");
                                              } catch(e){
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
                                          ideaModel.data!.business!
                                                      .nextPageUrl ==
                                                  null
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
                                : const SizedBox.shrink();
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
