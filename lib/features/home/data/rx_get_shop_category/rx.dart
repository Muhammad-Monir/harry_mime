// import 'dart:async';
// import 'dart:developer';

// import 'package:rxdart/rxdart.dart';
// import '/networks/api_acess.dart';
// import '../../../../networks/rx_base.dart';
// import 'api.dart';

// final class GetAllShopCategoryRX extends RxResponseInt {
//   final api = GetProductCategoryApi.instance;
//   final BehaviorSubject<String> _textSearch = BehaviorSubject<String>();
//   GetAllShopCategoryRX({required super.empty, required super.dataFetcher});

//   ValueStream get getProductCategoryData => dataFetcher.stream;
//   ValueStream<String> get sfetch => _textSearch.stream;


//   StreamTransformer<Map, Map> streamTransformer =
//       StreamTransformer<Map, Map>.fromHandlers(
//     handleData: (data, sink) {
//       if (getAllShopCategoryRXObj.sfetch.hasValue &&
//           getAllShopCategoryRXObj.sfetch.value.isNotEmpty) {
//         Map<dynamic, dynamic> filtermap = <dynamic, dynamic>{};
//         Map<dynamic, dynamic> returnMap = <dynamic, dynamic>{};
//         List searchList = data["data"]["categories"];
//         List filterList = [];

//         for (var element in searchList) {
//           log(element.toString());
//           if ((element['name'].toString().toUpperCase().isNotEmpty) &&
//               (element['name'].toString().toUpperCase().contains(
//                   getAllShopCategoryRXObj.sfetch.value
//                       .toString()
//                       .toUpperCase()
//                       .trim()))) {
//             filterList.add(element);
//             filtermap["categories"] = filterList;
//             returnMap["data"] = filtermap;
//             sink.add(returnMap);
//           }
//         }
//       } else {
//         sink.add(data);
//       }
//     },
//   );

//   Future<void> fetchAllShopCategoryData() async {
//     try {
//       Map categoryData = await api.fetchAllShopCategory();
//       handleSuccessWithReturn(categoryData);
//     } catch (error) {
//       handleErrorWithReturn(error);
//     }
//   }

//   searchText(String text) => _textSearch.sink.add(text);
// }
