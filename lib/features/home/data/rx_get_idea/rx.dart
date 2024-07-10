import 'dart:async';

import 'package:harry_mine/features/home/model/idea_model.dart';
import 'package:harry_mine/features/saved%20ideas/model/business_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

import 'api.dart';

final class GetIdeaRx extends RxResponseInt<Map> {
  final api = GetIdea.instance;

  //final BehaviorSubject<String> _textSearch = BehaviorSubject<String>();

  GetIdeaRx({required super.empty, required super.dataFetcher});

  ValueStream get getIdeaData => dataFetcher.stream;

  Future<void> fetchIdeaData(id, {pageNum}) async {
    try {
      Map<String, dynamic> ideaData = await api.fetchIdea(id, pageNum);
      IdeaModel ideaModel = IdeaModel.fromJson(ideaData);
      var businessList = ideaModel.data!.business!.data;
      BusinessModel data = BusinessModel(
          uid: businessList!.first.id!,
          categoryId: businessList.first.categoryId!,
          name: businessList.first.name!,
          capital: businessList.first.capital!,
          skills: businessList.first.skills!,
          necessaryPeople: businessList.first.necessaryPeople!);
      Map<String, dynamic> mapedData = {
        'hasNext': ideaModel.data!.business!.nextPageUrl == null ? false : true,
        'data': data
      };
      handleSuccessWithReturn(mapedData);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }

  Future<void> addOfflineData(Map mapData) async {
    handleSuccessWithReturn(mapData);
  }
}
