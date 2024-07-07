// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import '../features/address/presentation/add_address.dart';
// import '../features/authentication/presentation/forget_pw/forget_pw_screen.dart';
// import '../features/authentication/presentation/forget_pw/insertmail_screen.dart';
// import '../features/authentication/presentation/login/login_screen.dart';
// import '../features/authentication/presentation/signup/signup_screen.dart';
// import '../features/authentication/presentation/signup/verifyotp/otp.dart';
// import '../features/cart/presentation/apply_voucher.dart';
// import '../features/cart/presentation/cart.dart';
// import '../features/cart/presentation/time_slot.dart';
// import '../features/categories/presentation/shop_by_categories.dart';
// import '../features/food_detail/presentation/food_detail.dart';
// import '../features/home/presentation/home.dart';
// import '../features/order_history/presentation/order_detail.dart';
// import '../features/order_history/presentation/orders_ongoing.dart';
// import '../features/payment/presentation/payment.dart';
// import '../features/profile/presentation/change_password.dart';
// import '../features/profile/presentation/edit_address.dart';
// import '../features/profile/presentation/email.dart';
// import '../features/profile/presentation/nif.dart';
// import '../features/profile/presentation/phone.dart';
// import '../features/favourite/presentation/wishlist.dart';
// import '../features/profile/presentation/send_mail_to_admin.dart';
// import '../features/restaurant_detail/presentation/restaurant_detail.dart';
// import '../features/profile/presentation/profile.dart';
// import '../features/search/presentation/category_search.dart';
// import '../features/search/presentation/search.dart';
// import '../features/search/presentation/shop_search.dart';
// import '../loading_screen.dart';
// import '../navigation_screen.dart';
// import '../common_widgets/webview_helper.dart';

// final class Routes {
//   static final Routes _routes = Routes._internal();
//   Routes._internal();
//   static Routes get instance => _routes;

//   static const String logInScreen = '/logIn';
//   static const String signUpScreen = '/signUp';
//   static const String home = '/home';
//   static const String search = '/search';
//   static const String restauRantDetail = '/RestaurantDetailScreen';
//   // static const String addCard = '/Addcard';
//   static const String ordersOngoing = '/Ordersongoing';
//   static const String addAddress = '/AddAddress';
//   static const String foodDetail = '/FoodDetail';
//   static const String cartScreen = '/CartScreen';
//   static const String applyVoucher = '/ApplyVoucher';
//   static const String profile = '/Profile';
//   static const String nif = '/Nif';
//   static const String email = '/Email';
//   static const String phone = '/Phone';
//   static const String wishList = '/Wishlist';
//   static const String editAddress = '/Editaddress';
//   static const String orderdetail = '/OrderDetail';
//   static const String loadingScreen = '/Loading';
//   static const String otpScreen = '/OtpScreen';
//   static const String shopByCategories = '/ShopByCategories';
//   static const String timeSelector = '/TimeSelector';
//   static const String payMentScreen = '/PayMentScreen';
//   static const String webview = '/webview';
//   static const String categorySearchScreen = '/CategorySearchScreen';
//   static const String shopSearchScreen = '/ShopSearchScreen';
//   static const String sendMailToAdminScreen = '/SendMailToAdminScreen';
//   static const String forgotPWScreen = '/ForgotPWScreen';
//   static const String insertEmailScreen = '/InsertEmailScreen';
//   static const String changePassword = '/ChangePassword';
//   static const String navigationScreen = '/NavigationScreen';
// }

// final class RouteGenerator {
//   static final RouteGenerator _routeGenerator = RouteGenerator._internal();
//   RouteGenerator._internal();
//   static RouteGenerator get instance => _routeGenerator;

//   static Route<dynamic>? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.home:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ScreenTitle(widget: HomeScreen()),
//                 settings: settings)
//             : CupertinoPageRoute(builder: (context) => const HomeScreen());
//       case Routes.wishList:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const WishListScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const WishListScreen());
//       case Routes.search:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const SearchScreen(backButtonVisible: true),
//                 settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) =>
//                     const SearchScreen(backButtonVisible: true));
//       case Routes.email:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const EmailScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const EmailScreen());
//       case Routes.editAddress:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const EditAddressScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const EditAddressScreen());
//       case Routes.otpScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const VerifyOtpScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const VerifyOtpScreen());
//       case Routes.sendMailToAdminScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const SendMailToAdminScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const SendMailToAdminScreen());
//       case Routes.phone:
//         final args = settings.arguments as Map;
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: PhoneScreen(phone: args["phone"]), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => PhoneScreen(phone: args["phone"]));
//       case Routes.orderdetail:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const OrderDetailScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const OrderDetailScreen());
//       case Routes.changePassword:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ChangePasswordScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const ChangePasswordScreen());
//       case Routes.cartScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const CartScreen(backButtonVisible: true),
//                 settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) =>
//                     const CartScreen(backButtonVisible: true));
//       case Routes.insertEmailScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const InsertEmailScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const InsertEmailScreen());
//       case Routes.ordersOngoing:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: OrdersOngoingScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => OrdersOngoingScreen());
//       case Routes.nif:
//         final args = settings.arguments as Map;
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: NifScreen(nif: args["nif"]), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => NifScreen(nif: args["nif"]));
//       case Routes.addAddress:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const AddAddressScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const AddAddressScreen());
//       case Routes.shopSearchScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ShopSearchScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const ShopSearchScreen());
//       case Routes.profile:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ProfileScreen(backButtonVisible: true),
//                 settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) =>
//                     const ProfileScreen(backButtonVisible: true));
//       case Routes.applyVoucher:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ApplyVoucherScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const ApplyVoucherScreen());
//       case Routes.foodDetail:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const FoodDetailScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const FoodDetailScreen());
//       case Routes.restauRantDetail:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const RestaurantDetailScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const RestaurantDetailScreen());
//       case Routes.logInScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(widget: LogeinScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => LogeinScreen());
//       case Routes.signUpScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const SignUpScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const SignUpScreen());
//       // case Routes.addCard:
//       //   return Platform.isAndroid
//       //       ? _FadedTransitionRoute(widget: const AddCardScreen(), settings: settings)
//       //       : CupertinoPageRoute(builder: (context) => const AddCardScreen());
//       case Routes.loadingScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(widget: const Loading(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const Loading());
//       case Routes.shopByCategories:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ShopByCategories(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const ShopByCategories());
//       case Routes.timeSelector:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const TimeSelector(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const TimeSelector());
//       case Routes.categorySearchScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const CategorySearchScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const CategorySearchScreen());
//       case Routes.forgotPWScreen:
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const ForgotPWScreen(), settings: settings)
//             : CupertinoPageRoute(builder: (context) => const ForgotPWScreen());
//       case Routes.payMentScreen:
//         final args = settings.arguments as Map;
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: PayMentScreen(
//                   addressHeader: args["header"],
//                   address: args["detail"],
//                   totalPrice: args["totalPrice"],
//                   contraNo: args["contractNo"],
//                 ),
//                 settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => PayMentScreen(
//                       addressHeader: args["header"],
//                       address: args["detail"],
//                       totalPrice: args["totalPrice"],
//                       contraNo: args["contractNo"],
//                     ));
//       case Routes.webview:
//         final args = settings.arguments as Map;
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: WebviewHelper(
//                   name: args["name"],
//                   url: args["url"],
//                 ),
//                 settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => WebviewHelper(
//                       name: args["name"],
//                       url: args["url"],
//                     ));
//       case Routes.navigationScreen:
//         // final args = settings.arguments as Map;
//         // Widget widget = args["val"] as Widget;
//         return Platform.isAndroid
//             ? _FadedTransitionRoute(
//                 widget: const NavigationScreen(), settings: settings)
//             : CupertinoPageRoute(
//                 builder: (context) => const NavigationScreen());

//       // case Routes.sliderWebViewPage:
//       //   final args = settings.arguments as Map;
//       //   return Platform.isAndroid
//       //       ? _FadedTransitionRoute(
//       //           widget:
//       //               SliderWebViewPage(title: args["title"], url: args["url"]),
//       //           settings:
//       //               settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
//       //       : CupertinoPageRoute(
//       //           builder: (context) =>
//       //               SliderWebViewPage(title: args["title"], url: args["url"]));

//       default:
//         return null;
//     }
//   }
// }

// //  weenAnimationBuilder(
// //   child: Widget,
// //   tween: Tween<double>(begin: 0, end: 1),
// //   duration: Duration(milliseconds: 1000),
// //   curve: Curves.bounceIn,
// //   builder: (BuildContext context, double _val, Widget child) {
// //     return Opacity(
// //       opacity: _val,
// //       child: Padding(
// //         padding: EdgeInsets.only(top: _val * 50),
// //         child: child
// //       ),
// //     );
// //   },
// // );

// class _FadedTransitionRoute extends PageRouteBuilder {
//   final Widget widget;
//   @override
//   final RouteSettings settings;

//   _FadedTransitionRoute({required this.widget, required this.settings})
//       : super(
//           settings: settings,
//           reverseTransitionDuration: const Duration(milliseconds: 1),
//           pageBuilder: (BuildContext context, Animation<double> animation,
//               Animation<double> secondaryAnimation) {
//             return widget;
//           },
//           transitionDuration: const Duration(milliseconds: 1),
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secondaryAnimation,
//               Widget child) {
//             return FadeTransition(
//               opacity: CurvedAnimation(
//                 parent: animation,
//                 curve: Curves.ease,
//               ),
//               child: child,
//             );
//           },
//         );
// }

// class ScreenTitle extends StatelessWidget {
//   final Widget widget;

//   const ScreenTitle({super.key, required this.widget});

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       tween: Tween<double>(begin: .5, end: 1),
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.bounceIn,
//       builder: (context, value, child) {
//         return Opacity(
//           opacity: value,
//           child: child,
//         );
//       },
//       child: widget,
//     );
//   }
// }
