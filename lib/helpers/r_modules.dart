import 'package:get_it/get_it.dart';
import 'package:real_app/features/modules/app/r_app.dart';
import 'package:real_app/features/modules/bundy/r_bundy.dart';
import 'package:real_app/features/modules/dashboard/r_dashboard.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';

Future<void> registerModules(GetIt locator) async {
  locator.registerLazySingleton(() => AppModule());
  locator.registerLazySingleton(() => ThemesModule());
  locator.registerLazySingleton(() => DashboardModule());
  locator.registerLazySingleton(() => BundyModule());
  return;
}
