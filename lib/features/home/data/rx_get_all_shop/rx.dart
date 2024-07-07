// import 'dart:async';
// import 'dart:developer';
// import 'package:rxdart/rxdart.dart';
// import '../../../../helpers/di.dart';
// import '/constants/app_constants.dart';
// import '../../../../networks/rx_base.dart';
// import '../../../../networks/api_acess.dart';
// import 'api.dart';

// final class GetAllShopRX extends RxResponseInt {
//   final api = GetAllShopApi.instance;

//   final BehaviorSubject<String> _textSearch = BehaviorSubject<String>();

//   GetAllShopRX({required super.empty, required super.dataFetcher});

//   ValueStream get getAllShopData => dataFetcher.stream;
//   ValueStream<String> get sfetch => _textSearch.stream;

//   StreamTransformer<Map, Map> streamTransformer =
//       StreamTransformer<Map, Map>.fromHandlers(
//     handleData: (data, sink) {
//       if (getAllShopRXObj.sfetch.hasValue &&
//           getAllShopRXObj.sfetch.value.isNotEmpty) {
//         Map<dynamic, dynamic> filtermap = <dynamic, dynamic>{};
//         Map<dynamic, dynamic> returnMap = <dynamic, dynamic>{};
//         Map<dynamic, dynamic> childMap = <dynamic, dynamic>{};
//         List searchList = data["data"]["restaurants"]["data"];
//         List filterList = [];

//         for (var element in searchList) {
//           log(element.toString());
//           if ((element['name'].toString().toUpperCase().isNotEmpty) &&
//               (element['name'].toString().toUpperCase().contains(getAllShopRXObj
//                   .sfetch.value
//                   .toString()
//                   .toUpperCase()
//                   .trim()))) {
//             filterList.add(element);
//             childMap["data"] = filterList;
//             filtermap["restaurants"] = childMap;
//             returnMap["data"] = filtermap;
//             sink.add(returnMap);
//           }
//         }
//       } else {
//         sink.add(data);
//       }
//     },
//   );

//   Future<void> fetchAllShopData() async {
//     try {
//       Map allShopData = await api.fetchAllShop(
//           appData.read(kKeySelectedLat), appData.read(kKeySelectedLng));
//       handleSuccessWithReturn(allShopData);
//     } catch (error) {
//       handleErrorWithReturn(error);
//     }
//   }

//   searchText(String text) => _textSearch.sink.add(text);
// }
