import 'package:get_it/get_it.dart';
import 'package:product_list_app/core/viewmodels/home_model.dart';

import 'core/services/api.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerFactory(() => HomeModel());
  locator.registerLazySingleton(() => Api());
}
