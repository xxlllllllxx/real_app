import 'package:get_it/get_it.dart';
import 'package:real_app/features/modules/app/r_app.dart';
import 'package:real_app/features/modules/bundy/r_bundy.dart';
import 'package:real_app/features/modules/dashboard/r_dashboard.dart';

Future<void> registerModules(GetIt locator) async {
  locator.registerLazySingleton(() => AppModule(locator));
  locator.registerLazySingleton(() => DashboardModule(locator));
  locator.registerLazySingleton(() => BundyModule(locator));
  return;
}
