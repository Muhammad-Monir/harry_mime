//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:harry_mine/helpers/db_util.dart';
import 'package:harry_mine/services/dao_init.dart';
import '/provider/provides.dart';

final locator = GetIt.instance;
final appData = locator.get<GetStorage>();

void diSetup() {
  // for init database
  locator.registerSingletonAsync(() => DbSingleton.instance.create());

  locator.registerSingleton<DbUtil>(DbUtil());

  //locator.registerLazySingleton(() => FirebaseMessaging.instance);
  locator.registerSingleton<GetStorage>(GetStorage());
  // locator.registerSingleton<WebViewController>(WebViewController());
  //locator.registerSingleton<DistanceProvider>(DistanceProvider());
  locator.registerSingleton<GenericDi>(
      GenericDi()); //locator.registerSingleton<PlcaeMarkAddress>(PlcaeMarkAddress());
  // locator.registerSingleton<DefaultAddress>(DefaultAddress());
}
