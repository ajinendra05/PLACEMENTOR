import 'package:get_it/get_it.dart';

import 'backend/firbase_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DataBaseService('InternDetails'));
  locator.registerLazySingleton(() => ReadInternDetails());
}
