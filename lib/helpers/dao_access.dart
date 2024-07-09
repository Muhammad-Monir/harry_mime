
import 'package:rxdart/rxdart.dart';
import '../features/saved ideas/data/rx_get_all_ideas/rx.dart';



GetBusinessRX getBusinessRX =
    GetBusinessRX(empty: {}, dataFetcher: BehaviorSubject<Map>());