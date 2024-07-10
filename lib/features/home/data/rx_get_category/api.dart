import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetCategory {
  static final GetCategory _singleton = GetCategory._internal();
  GetCategory._internal();
  static GetCategory get instance => _singleton;
  Future<Map<String, dynamic>> featchCategory() async {
    try {
      Response response = await getHttp(Endpoints.categoryData());
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
