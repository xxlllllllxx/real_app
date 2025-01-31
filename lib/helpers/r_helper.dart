import 'package:get_it/get_it.dart';
import 'package:real_app/helpers/d_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part './d_preference.dart';
part './d_logs.dart';

GetIt locator = GetIt.instance;
SharedPreferences preferences = EmptySharedPreference();
Future<SharedPreferences> getPreference() =>
    SharedPreferences.getInstance().then((e) => preferences = e);

Future<void> registerHelpers(GetIt locator) async {
  await getPreference();
  CPreferences.databaseName.setString(s_databaseName);
  return;
}

Future<void> loadSettings(GetIt locator) async {}
