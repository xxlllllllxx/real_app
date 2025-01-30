import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;
SharedPreferences preferences = EmptySharedPreference();
Future<SharedPreferences> getPreference() =>
    SharedPreferences.getInstance().then((e) => preferences = e);

Future<void> registerHelpers(GetIt locator) async {
  await getPreference();
  return;
}

enum CPreferences {
  dbLink,
}

extension CXPreferences on CPreferences {
  String? get stringValue => preferences.getString(toString());
  
  Future<bool> setString(String value) {
    return preferences.setString(toString(), value);
  }

  bool? get boolValue => preferences.getBool(toString());

  Future<bool> setBool(bool value) {
    return preferences.setBool(toString(), value);
  }

  int? get intValue => preferences.getInt(toString());

  Future<bool> setInt(int value) {
    return preferences.setInt(toString(), value);
  }

  double? get doubleValue => preferences.getDouble(toString());

  Future<bool> setDouble(double value) {
    return preferences.setDouble(toString(), value);
  }

  List<String>? get stringList => preferences.getStringList(toString());

  Future<bool> setStringList(List<String> value) {
    return preferences.setStringList(toString(), value);
  }
}

enum LogType {
  info,
  warning,
  error,
  
}

class EmptySharedPreference implements SharedPreferences {
  @override
  Future<bool> clear() async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> commit() async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  bool containsKey(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Object? get(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  bool? getBool(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  double? getDouble(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  int? getInt(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Set<String> getKeys() => throw UnimplementedError("Empty Shared Preference");

  @override
  List<String>? getStringList(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  String? getString(String key) =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<void> reload() async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> remove(String key) async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> setBool(String key, bool value) async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> setDouble(String key, double value) async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> setInt(String key, int value) async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> setString(String key, String value) async =>
      throw UnimplementedError("Empty Shared Preference");

  @override
  Future<bool> setStringList(String key, List<String> value) async =>
      throw UnimplementedError("Empty Shared Preference");
}
