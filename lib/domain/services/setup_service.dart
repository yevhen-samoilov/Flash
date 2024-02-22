import 'package:flash/domain/routes/routes_services.dart';
import 'package:get_it/get_it.dart';

class SetupService {
  static final GetIt locator = GetIt.instance;

  static void setupLocator() {
    locator.registerLazySingleton(() => NavigationService());
  }
}
