// ignore_for_file: overridden_fields

import 'package:harry_mine/features/saved%20ideas/data/rx_get_all_ideas/dao.dart';
import 'package:harry_mine/features/saved%20ideas/model/business_model.dart';
import 'package:rxdart/streams.dart';

import '../../../../networks/rx_base.dart';

final class GetBusinessRX extends RxResponseIntl {
  final dao = GetAllBusinessDao.instance;

  GetBusinessRX({required super.empty, required super.dataFetcher});

  ValueStream get getBusinessData => dataFetcher.stream;

  Future<void> fetchCartData() async {
    try {
      List<BusinessModel> businessData = await dao.fetchAllBusiness();
      Map<String, dynamic> bData = {'data': businessData};
      handleSuccessWithReturn(bData);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}