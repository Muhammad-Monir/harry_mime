// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/helpers/di.dart';
import '/helpers/toast.dart';
import '../constants/app_constants.dart';
import '../provider/provides.dart';

//final appData = locator.get<GetStorage>();
final plcaeMarkAddress = locator.get<PlcaeMarkAddress>();
//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

Future<String?> networkImageToBase64(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));
  final bytes = response.bodyBytes;

  // ignore: unnecessary_null_comparison
  return (bytes != null ? base64Encode(bytes) : null);
}

Future<void> setInitValue() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    appData.writeIfNull(
        kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo =
        await deviceInfo.androidInfo; // unique ID on Android
    appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  }
  await Future.delayed(const Duration(seconds: 2));
}

Future<void> initiInternetChecker() async {
  InternetConnectionChecker.createInstance(
          checkTimeout: const Duration(seconds: 1),
          checkInterval: const Duration(seconds: 2))
      .onStatusChange
      .listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        // ToastUtil.showShortToast('Data connection is available.'.tr);
        break;
      case InternetConnectionStatus.disconnected:
        ToastUtil.showNoInternetToast();
        break;
    }
  });
}

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

Future<void> getInvisible() async {
  Future.delayed(const Duration(milliseconds: 500), () {});
}

Future<File> getLocalFile(String filename) async {
  File f = File(filename);
  return f;
}

// void showMaterialDialog(
//   BuildContext context,
// ) {
//   showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: Text(
//               "Do you want to exit the app?",
//               textAlign: TextAlign.center,
//               style: TextFontStyle.headline16cDFE1E6Poppins300,
//             ),
//             actions: <Widget>[
//               customeButton(
//                   name: "No".tr,
//                   onCallBack: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   height: 30.sp,
//                   minWidth: .3.sw,
//                   borderRadius: 30.r,
//                   color: AppColors.cF4F4F4,
//                   textStyle: GoogleFonts.montserrat(
//                       fontSize: 17.sp,
//                       color: AppColors.allPrimaryColor,
//                       fontWeight: FontWeight.w700),
//                   context: context),
//               customeButton(
//                   name: "Yes".tr,
//                   onCallBack: () {
//                     if (Platform.isAndroid) {
//                       SystemNavigator.pop();
//                     } else if (Platform.isIOS) {
//                       exit(0);
//                     }
//                   },
//                   height: 30.sp,
//                   minWidth: .3.sw,
//                   borderRadius: 30.r,
//                   color: AppColors.allPrimaryColor,
//                   textStyle: GoogleFonts.montserrat(
//                       fontSize: 17.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700),
//                   context: context),
//             ],
//           ));
// }

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
