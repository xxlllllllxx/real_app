import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:real_app/helpers/df_bloc_observer.dart';
import 'package:sqflite/sqflite.dart';

part 'df_logs.dart';

GetIt locator = GetIt.instance;

Future<void> registerHelpers(GetIt locator) async {
  // CSettings.databaseName.setString(s_databaseName);
  Bloc.observer = const AppBlocObserver();
  return;
}
