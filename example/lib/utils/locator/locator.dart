import 'package:get_it/get_it.dart';

import '../../utils/navigation/navigation_service.dart';

GetIt _locator = GetIt.instance;

/// function to set up locator
void setupLocator() {
  _locator.registerLazySingleton(() => NavigationService());
}

/// Global variable to get the current [NavigationService] object
NavigationService appNavigator = _locator<NavigationService>();
