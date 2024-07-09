import 'package:provider/provider.dart';

import '../provider/email.dart';

import '../provider/provides.dart';

var providers = [
  ChangeNotifierProvider<ItemOptionIndex>(
    create: ((context) => ItemOptionIndex()),
  ),
  ChangeNotifierProvider<VoucherProvider>(
    create: ((context) => VoucherProvider()),
  ),
  ChangeNotifierProvider<PlcaeMarkAddress>(
    create: ((context) => PlcaeMarkAddress()),
  ),
  ChangeNotifierProvider<GenericBool>(
    create: ((context) => GenericBool()),
  ),
  ChangeNotifierProvider<SelectedSubCat>(
    create: ((context) => SelectedSubCat()),
  ),
  ChangeNotifierProvider<GenericProvider>(
    create: ((context) => GenericProvider()),
  ),
  ChangeNotifierProvider<CartCounter>(
    create: ((context) => CartCounter()),
  ),
];
