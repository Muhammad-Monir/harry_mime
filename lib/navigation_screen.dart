// // ignore_for_file: unused_field, deprecated_member_use

// import 'package:badges/badges.dart' as badges;
// import 'package:custom_navigation_bar/custom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import '/gen/assets.gen.dart';
// import '/constants/text_font_style.dart';

// import 'constants/app_constants.dart';

// import 'features/home/presentation/home.dart';

// import 'gen/colors.gen.dart';
// import 'helpers/di.dart';
// import 'helpers/helper_methods.dart';
// import 'helpers/toast.dart';
// import 'networks/api_acess.dart';
// import 'provider/provides.dart';

// final class NavigationScreen extends StatefulWidget {
//   final Widget? pageNum;
//   const NavigationScreen({
//     super.key,
//     this.pageNum,
//   });

//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   // final appData = GetStorage();
//   //Variable for navigation Index
//   int _currentIndex = 0;
//   //Variable for navigation Color Index
//   int _colorIndex = 0;

//   final bool _isFisrtBuild = true;
//   bool _navigationOn = true;
//   //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   final List<StatefulWidget> _screens = [
//     const HomeScreen(),

//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Object? args;
//     StatefulWidget? screenPage;
//     if (_isFisrtBuild) {
//       args = ModalRoute.of(context)!.settings.arguments;
//     }
//     if (args != null) {
//       _colorIndex = 5;
//       screenPage = args as StatefulWidget;
//       var newColorindex = -1;

//       for (var element in _screens) {
//         newColorindex++;
//         if (element.toString() == screenPage.toString()) {
//           _colorIndex = newColorindex;
//           _currentIndex = newColorindex;
//           break;
//         }
//       }
//     }

//     return PopScope(
//       canPop: false,
//       onPopInvoked: (bool didPop) async {
//         showMaterialDialog(context);
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         extendBody: true,
//         onDrawerChanged: (isOpened) => setState(() {
//           _navigationOn = !isOpened;
//         }),
//         body: Center(child: (screenPage != null) ? screenPage : _screens.elementAt(_currentIndex)),
//         bottomNavigationBar: CustomNavigationBar(
//           iconSize: 30.r,
//           selectedColor: Colors.red,
//           strokeColor: Colors.red,
//           unSelectedColor: Colors.black,
//           backgroundColor: Colors.white,
//           items: [
//             CustomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 Assets.icons.home,
//                 color: (_currentIndex == 0) ? AppColors.allPrimaryColor : AppColors.c000000,
//               ),
//               title: Text("${"Home".tr} ",
//                   style: TextFontStyle.headline12StyleMontserrat.copyWith(
//                     color: (_currentIndex == 0) ? AppColors.allPrimaryColor : AppColors.c000000,
//                   )),
//             ),
//             CustomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 Assets.icons.search,
//                 color: (_currentIndex == 1) ? AppColors.allPrimaryColor : AppColors.c000000,
//               ),
//               title: Text(
//                 "${"Search".tr} ",
//                 style: TextFontStyle.headline12StyleMontserrat.copyWith(
//                   color: (_currentIndex == 1) ? AppColors.allPrimaryColor : AppColors.c000000,
//                 ),
//               ),
//             ),
//             CustomNavigationBarItem(
//                 title: Text(
//                   "Pedidos   ".tr,
//                   style: TextFontStyle.headline12StyleMontserrat.copyWith(
//                     color: (_currentIndex == 2) ? AppColors.allPrimaryColor : AppColors.c000000,
//                   ),
//                 ),
//                 icon: StreamBuilder(
//                     stream: getCartRXObj.getCartData,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData && snapshot.data["data"] != null) {
//                         Map data = snapshot.data["data"];
//                         List carts = data["carts"];
//                         return badges.Badge(
//                           position: badges.BadgePosition.topEnd(top: -8, end: -20),
//                           showBadge: carts.isNotEmpty,
//                           badgeAnimation: const badges.BadgeAnimation.rotation(
//                             animationDuration: Duration(seconds: 1),
//                             colorChangeAnimationDuration: Duration(seconds: 1),
//                             loopAnimation: false,
//                             curve: Curves.fastOutSlowIn,
//                             colorChangeAnimationCurve: Curves.easeInCubic,
//                           ),
//                           badgeContent: Text(
//                             carts.length.toString(),
//                             style: const TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           child: SvgPicture.asset(
//                             Assets.icons.cart,
//                             color: (_currentIndex == 2) ? AppColors.allPrimaryColor : AppColors.c000000,
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return SvgPicture.asset(
//                           Assets.icons.cart,
//                           color: (_currentIndex == 2) ? AppColors.allPrimaryColor : AppColors.c000000,
//                         );
//                       }
//                       return SvgPicture.asset(
//                         Assets.icons.cart,
//                         color: (_currentIndex == 2) ? AppColors.allPrimaryColor : AppColors.c000000,
//                       );
//                     })),
//             CustomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 Assets.icons.user,
//                 color: (_currentIndex == 3) ? AppColors.allPrimaryColor : AppColors.c000000,
//               ),
//               title: Text(
//                 "${"Profile".tr} ",
//                 style: TextFontStyle.headline12StyleMontserrat.copyWith(
//                   color: (_currentIndex == 3) ? AppColors.allPrimaryColor : AppColors.c000000,
//                 ),
//               ),
//             ),
//           ],
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             if (appData.read(kKeyIsLoggedIn) || index == 1 || index == 0) {
//               if (index == 1) {
//                 context.read<SelectedSubCat>().selectedSubCatIDClear();
//               }

//               setState(() {
//                 _currentIndex = index;
//               });
//             } else {
//               ToastUtil.showLongToast("You need to log in first");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
