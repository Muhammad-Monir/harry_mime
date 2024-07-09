import 'dart:async';

import 'package:harry_mine/features/home/model/idea_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

import 'api.dart';

final class GetIdeaRx extends RxResponseInt<IdeaModel> {
  final api = GetIdea.instance;

  //final BehaviorSubject<String> _textSearch = BehaviorSubject<String>();

  GetIdeaRx({required super.empty, required super.dataFetcher});

  ValueStream get getIdeaData => dataFetcher.stream;

  Future<void> fetchIdeaData(id, {pageNum}) async {
    try {
      Map<String, dynamic> ideaData = await api.fetchIdea(id, pageNum);
      IdeaModel ideaModel = IdeaModel.fromJson(ideaData);
      handleSuccessWithReturn(ideaModel);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
