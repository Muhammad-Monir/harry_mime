import 'dart:async';
import 'package:harry_mine/features/home/model/category_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetCategoryRx extends RxResponseInt<CategoryModel> {
  final api = GetCategory.instance;

  //final BehaviorSubject<String> _textSearch = BehaviorSubject<String>();

  GetCategoryRx({required super.empty, required super.dataFetcher});

  ValueStream get getCategoryData => dataFetcher.stream;

  Future<void> fetchCategoryData() async {
    try {
      Map<String, dynamic> categoryData = await api.featchCategory();
      CategoryModel categoryModel = CategoryModel.fromJson(categoryData);
      handleSuccessWithReturn(categoryModel);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
