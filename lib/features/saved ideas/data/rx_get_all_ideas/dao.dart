import 'package:harry_mine/constants/table_constants.dart';
import 'package:harry_mine/features/saved%20ideas/model/business_model.dart';
import 'package:harry_mine/helpers/db.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetAllBusinessDao {
  static final GetAllBusinessDao _singleton = GetAllBusinessDao._internal();
  GetAllBusinessDao._internal();
  static GetAllBusinessDao get instance => _singleton;
  Future<List<BusinessModel>> fetchAllBusiness() async {
    try {
      List<Map<String, dynamic>> resultdata =
          await DbUtil().getAllData(TableConstant.kSaveTableName);
      List<BusinessModel> list = List.generate(resultdata.length, (i) {
        return BusinessModel.fromJson(resultdata[i]);
      });
      return list;
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
