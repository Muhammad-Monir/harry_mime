import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetSliderRX extends RxResponseInt {
  final api = GetSliderApi.instance;

  GetSliderRX({required super.empty, required super.dataFetcher});

  ValueStream get getSliderData => dataFetcher.stream;

  Future<void> fetchSliderData() async {
    try {
      Map categoryData = await api.fetchSlider();
      handleSuccessWithReturn(categoryData);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
