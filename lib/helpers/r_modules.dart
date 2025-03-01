part of 'r_helper.dart';

Future<void> registerModules(GetIt locator) async {
  locator.registerLazySingleton(() => AppModule());
  locator.registerLazySingleton(() => AuthModule());
  locator.registerLazySingleton(() => ThemesModule());
  locator.registerLazySingleton(() => DashboardModule());
  locator.registerLazySingleton(() => BundyModule());
  return;
}
