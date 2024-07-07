import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Working'),
      ),
    );
  }
}
















// // ignore_for_file: unused_local_variable








// import 'dart:async';
// import 'dart:developer';

// import 'package:auto_animated/auto_animated.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import '../../../common_widgets/row_tile.dart';
// import '../../../helpers/di.dart';
// import '../../../networks/exception_handler/error_response.dart';

// import '/gen/assets.gen.dart';
// import '../../../../gen/colors.gen.dart';
// import '/features/home/presentation/widgets/home_slider.dart';
// import '/helpers/all_routes.dart';
// import '/helpers/loading_helper.dart';
// import '/helpers/navigation_service.dart';
// import '/helpers/toast.dart';
// import '/helpers/ui_helpers.dart';
// import '/networks/api_acess.dart';

// import '../../../constants/app_constants.dart';
// import '../../../constants/text_font_style.dart';
// import '../../../helpers/animation_helper.dart';

// import '../../../provider/address.dart';
// import '../../../provider/provides.dart';

// import '../../../common_widgets/custom_button.dart';
// import '../../../common_widgets/icon_holder_widget.dart';
// import '../../../common_widgets/loading_indicators.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
//       GlobalKey<LiquidPullToRefreshState>();
//   bool value = false;

//   Future<void> _handleRefresh() async {
//     try {
//       // await getAllShopCategoryRXObj.fetchAllShopCategoryData();
//       // await getAllShopRXObj.fetchAllShopData();
//       // await getSliderRXObj.fetchSliderData();
//     } catch (error) {
//       log(error.toString());
//       ToastUtil.showShortToast(ResponseMessage.DEFAULT.tr);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var alertDialog = AlertDialog(
//       actions: [
//         customeButton(
//             name: "Gravar".tr,
//             onCallBack: () {
//               // setting it as defalt address
//               context.read<GenericBool>().isDefaultAddress = true;
//               //  NavigationService.navigateTo(Routes.addAddress);
//             },
//             height: 56.sp,
//             minWidth: 1.sw,
//             borderRadius: 30.r,
//             color: AppColors.allPrimaryColor,
//             textStyle: GoogleFonts.montserrat(
//                 fontSize: 17.sp,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700),
//             context: context),
//       ],
//       content: Text(
//         "Add address To contiinue browsing".tr,
//         textAlign: TextAlign.center,
//         style: TextFontStyle.headline14StyleMontserrat,
//       ),
//     );
//     var column = Column(
//       children: [
//         UIHelper.verticalSpaceMediumLarge,
//         //home app bar
//         Row(
//           children: [
//             if (!appData.read(kKeyIsExploring))
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${"Entregar em".tr}:",
//                     style: TextFontStyle.headline12StyleMontserrat500,
//                   ),
//                   UIHelper.verticalSpace(5.sp),
//                   //Address
//                   InkWell(
//                     onTap: () {
//                       //getAllAddressRXObj.fetchAllDeliveryAddressData();
//                       showGeneralDialog(
//                           context: context,
//                           barrierDismissible: true,
//                           transitionDuration: const Duration(microseconds: 500),
//                           barrierLabel:
//                               MaterialLocalizations.of(context).dialogLabel,
//                           barrierColor: AppColors.c000000.withOpacity(.7),
//                           pageBuilder: (context, _, __) {
//                             return Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 UIHelper.verticalSpaceMedium,
//                                 SizedBox(
//                                   width: double.infinity,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.only(
//                                             bottomLeft: Radius.circular(20.r),
//                                             bottomRight:
//                                                 Radius.circular(20.r))),
//                                     child: ConstrainedBox(
//                                       constraints:
//                                           BoxConstraints(maxHeight: .9.sh),
//                                       // child: StreamBuilder(
//                                       //     stream: getAllAddressRXObj
//                                       //         .getAllDeliveryAddressData,
//                                       //     builder: (context,
//                                       //         AsyncSnapshot addressesSnap) {
//                                       //       if (addressesSnap.hasData) {
//                                       //         Addresses addresses =
//                                       //             addressesSnap.data;
//                                       //         List<Address> addrressList =
//                                       //             addresses.data!.addresses;

//                                       //         if (addrressList.isNotEmpty) {
//                                       //           return LiveList(
//                                       //               showItemInterval:
//                                       //                   const Duration(
//                                       //                       milliseconds: 50),
//                                       //               showItemDuration:
//                                       //                   const Duration(
//                                       //                       milliseconds: 100),
//                                       //               reAnimateOnVisibility: true,
//                                       //               scrollDirection:
//                                       //                   Axis.vertical,
//                                       //               padding:
//                                       //                   const EdgeInsets.all(0),
//                                       //               //physics: const NeverScrollableScrollPhysics(),
//                                       //               separatorBuilder: (context,
//                                       //                       index) =>
//                                       //                   UIHelper
//                                       //                       .customDivider(),
//                                       //               shrinkWrap: true,
//                                       //               itemCount:
//                                       //                   addrressList.length + 1,
//                                       //               itemBuilder:
//                                       //                   animationItemBuilder(
//                                       //                       (index) {
//                                       //                 if (index <
//                                       //                     addrressList.length) {
//                                       //                   return AddressDialog(
//                                       //                     address: addrressList
//                                       //                         .elementAt(index),
//                                       //                   );
//                                       //                 } else {
//                                       //                   return InkWell(
//                                       //                     onTap: () async {
//                                       //                       try {
//                                       //                         context
//                                       //                             .read<
//                                       //                                 GenericBool>()
//                                       //                             .isDefaultAddressClear();
//                                       //                         context
//                                       //                             .read<
//                                       //                                 PlcaeMarkAddress>()
//                                       //                             .clearPlcaeMarkAddress();
//                                       //                         NavigationService
//                                       //                             .navigateTo(Routes
//                                       //                                 .addAddress);
//                                       //                       } catch (error) {
//                                       //                         log(error
//                                       //                             .toString());
//                                       //                         ToastUtil.showShortToast(
//                                       //                             ResponseMessage
//                                       //                                 .DEFAULT
//                                       //                                 .tr);
//                                       //                       }
//                                       //                     },
//                                       //                     child: Padding(
//                                       //                       padding: EdgeInsets
//                                       //                           .symmetric(
//                                       //                               horizontal:
//                                       //                                   15.sp,
//                                       //                               vertical:
//                                       //                                   10.sp),
//                                       //                       child:
//                                       //                           Row(children: [
//                                       //                         const IconHolder(
//                                       //                           bgColor: AppColors
//                                       //                               .allPrimaryColor,
//                                       //                           icon: Icons.add,
//                                       //                           iconColor:
//                                       //                               AppColors
//                                       //                                   .cFFFFFF,
//                                       //                         ),
//                                       //                         UIHelper
//                                       //                             .horizontalSpaceSmall,
//                                       //                         Text(
//                                       //                           "Adicionar morada"
//                                       //                               .tr,
//                                       //                           style: TextFontStyle
//                                       //                               .headline14StyleMontserrat400,
//                                       //                         )
//                                       //                       ]),
//                                       //                     ),
//                                       //                   );
//                                       //                 }
//                                       //               }));
//                                       //         } else {
//                                       //           return const SizedBox.expand();
//                                       //         }
//                                       //       } else if (addressesSnap.hasError) {
//                                       //         const SizedBox.shrink();
//                                       //       }
//                                       //       return Center(
//                                       //         child: loadingIndicatorCircle(
//                                       //             context: context),
//                                       //       );
//                                       //     }),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           });
//                     },
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: .35.sw,
//                           child: Text(
//                             "${Provider.of<AddressProvider>(context).name}!",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextFontStyle.headline14StyleMontserrat600,
//                           ),
//                         ),
//                         UIHelper.horizontalSpaceSmall,
//                         Icon(
//                           CupertinoIcons.chevron_down,
//                           color: AppColors.c0A0909,
//                           size: 15.sp,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             const Spacer(),
//             //wish list
//             if (!appData.read(kKeyIsExploring))
//               InkWell(
//                 onTap: () {
//                   // NavigationService.navigateTo(Routes.wishList);
//                 },
//                 child: const IconHolder(
//                   icon: Icons.favorite_border,
//                   iconColor: AppColors.cFEFFFE,
//                   bgColor: AppColors.allPrimaryColor,
//                 ),
//               ),

//             if (appData.read(kKeyIsExploring))
//               InkWell(
//                 onTap: () {
//                   //NavigationService.navigateTo(Routes.logInScreen);
//                 },
//                 child: const IconHolder(
//                   icon: Icons.login_rounded,
//                   iconColor: AppColors.allPrimaryColor,
//                   bgColor: AppColors.cFEFFFE,
//                 ),
//               ),
//             UIHelper.horizontalSpaceSmall,
//             //cart page
//             InkWell(
//               onTap: () {
//                 // NavigationService.navigateTo(Routes.cartScreen);
//               },
//               // child:
//               // const CartIcon(),
//             ),
//           ],
//         ),
//         //home search bar
//         UIHelper.verticalSpaceMedium,
//         AnimateIfVisible(
//           key: const Key("2"),
//           reAnimateOnVisibility: true,
//           builder: animationBuilder(
//             xOffset: -.15,
//             InkWell(
//               onTap: () {
//                 // NavigationService.navigateTo(Routes.search);
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10.r),
//                 height: 48.sp,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(24.r)),
//                     color: AppColors.cF4F4F4),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.search),
//                     UIHelper.horizontalSpaceSmall,
//                     Text("Pesquisa".tr)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //slider
//         UIHelper.verticalSpaceMedium,
//         // StreamBuilder(
//         //     stream: getSliderRXObj.getSliderData,
//         //     builder: (context, AsyncSnapshot snapshot) {
//         //       if (snapshot.hasData && snapshot.data["data"] != null) {
//         //         Map data = snapshot.data["data"];
//         //         if (data.isNotEmpty) {
//         //           SliderData sliderData = SliderData.fromJson(snapshot.data);
//         //           List list = data["sliders"];
//         //           if (list.isNotEmpty) {
//         //             return AnimateIfVisible(
//         //                 key: const Key("1"),
//         //                 reAnimateOnVisibility: true,
//         //                 builder: animationBuilder(
//         //                   xOffset: -15,
//         //                   SizedBox(
//         //                       height: .29.sh,
//         //                       child: HomeSlideDemo(
//         //                           sliders: sliderData.data!.sliders!)),
//         //                 ));
//         //           } else {
//         //             return const SizedBox.shrink();
//         //           }
//         //         } else {
//         //           return const SizedBox.shrink();
//         //         }
//         //       } else if (snapshot.hasError) {
//         //         return const SizedBox.shrink();
//         //       }
//         //       return SizedBox(
//         //         height: MediaQuery.of(context).size.height - 100,
//         //         width: MediaQuery.of(context).size.width,
//         //         child: Center(
//         //           child: loadingIndicatorCircle(context: context),
//         //         ),
//         //       );
//         //     }),
//         //Categories title
//         RowTitleNav(
//           title: "Categories".tr,
//           function: () {
//             // NavigationService.navigateTo(Routes.categorySearchScreen);
//           },
//         ),
//         //Category list
//         UIHelper.verticalSpaceMedium,
//         // StreamBuilder(
//         //     stream: getAllShopCategoryRXObj.getProductCategoryData,
//         //     builder: (context, AsyncSnapshot categoryData) {
//         //       if (categoryData.hasData) {
//         //         Map data = categoryData.data["data"];
//         //         if (data.isNotEmpty) {
//         //           List categories = data["categories"];
//         //           return AnimateIfVisible(
//         //               key: const Key("3"),
//         //               reAnimateOnVisibility: true,
//         //               builder: animationBuilder(
//         //                   xOffset: -.15,
//         //                   SizedBox(
//         //                     height: 60.sp,
//         //                     child: LiveList(
//         //                       showItemInterval:
//         //                           const Duration(milliseconds: 50),
//         //                       showItemDuration:
//         //                           const Duration(milliseconds: 50),
//         //                       reAnimateOnVisibility: true,
//         //                       shrinkWrap: true,
//         //                       scrollDirection: Axis.horizontal,
//         //                       itemCount: categories.length,
//         //                       separatorBuilder: (context, index) =>
//         //                           UIHelper.horizontalSpaceSmall,
//         //                       itemBuilder: animationItemBuilder((index) {
//         //                         Map category = categories[index];
//         //                         return CategoryWidget(
//         //                             item: category, imageSwitch: false);
//         //                       }),
//         //                     ),
//         //                   )));
//         //         } else {
//         //           return const SizedBox.shrink();
//         //         }
//         //       } else if (categoryData.hasError) {
//         //         return const SizedBox.shrink();
//         //       }
//         //       return SizedBox(
//         //         height: MediaQuery.of(context).size.height - 100,
//         //         width: MediaQuery.of(context).size.width,
//         //         child: Center(
//         //           child: loadingIndicatorCircle(context: context),
//         //         ),
//         //       );
//         //     }),
//         //Highlited title
//         UIHelper.verticalSpaceMedium,
//         RowTitleNav(
//           title: "Em destaque".tr,
//           function: () {
//             // NavigationService.navigateTo(Routes.shopSearchScreen);
//           },
//         ),
//         UIHelper.verticalSpaceMedium,
//         //shop list
//         StreamBuilder(
//             stream: null,
//             //getAllShopRXObj.getAllShopData,
//             builder: (context, AsyncSnapshot allshopdata) {
//               if (allshopdata.hasData && allshopdata.data["data"] != null) {
//                 Map data = allshopdata.data["data"];
//                 if (data.isNotEmpty) {
//                   List restaurants = data["restaurants"]["data"];
//                   if (restaurants.isNotEmpty) {
//                     return LiveList(
//                         showItemInterval: const Duration(milliseconds: 50),
//                         showItemDuration: const Duration(milliseconds: 100),
//                         reAnimateOnVisibility: true,
//                         scrollDirection: Axis.vertical,
//                         padding: const EdgeInsets.all(0),
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: restaurants.length,
//                         itemBuilder: animationItemBuilder((index) => SizedBox()
//                             // CustomeShopWidget(restaurant: restaurants[index]),
//                             ));
//                   } else {
//                     return Lottie.asset(Assets.lottie.itemNotFound);
//                   }
//                 } else {
//                   return Lottie.asset(Assets.lottie.itemNotFound);
//                 }
//               } else if (allshopdata.hasError) {
//                 return const SizedBox.expand();
//               }
//               return SizedBox(
//                 height: MediaQuery.of(context).size.height - 100,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: loadingIndicatorCircle(context: context),
//                 ),
//               );
//             }),
//         UIHelper.verticalSpaceLarge,
//       ],
//     );

//     return LiquidPullToRefresh(
//       color: AppColors.allPrimaryColor,
//       key: _refreshIndicatorKey,
//       onRefresh: _handleRefresh,
//       showChildOpacityTransition: false,
//       child: SingleChildScrollView(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         child: Padding(
//             padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
//             child: appData.read(kKeyIsLoggedIn)
//                 ? appData.read(kKeySelectedLocation)
//                     ? column
//                     : alertDialog
//                 : column
//             //column
//             ),
//       ),
//     );
//   }
// }
