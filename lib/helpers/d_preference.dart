part of 'r_helper.dart';

enum CPreferences {
  databaseName,
  databasePath,
  databaseLink,
}

extension CXPreferences on CPreferences {
  String get stringValue {
    String? x = preferences.getString(toString());
    if(x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }
  
  Future<bool> setString(String value) {
    return preferences.setString(toString(), value);
  }

  bool get boolValue {
    bool? x = preferences.getBool(toString());
    if(x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setBool(bool value) {
    return preferences.setBool(toString(), value);
  }

  int get intValue {
    int? x = preferences.getInt(toString());
    if(x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setInt(int value) {
    return preferences.setInt(toString(), value);
  }

  double get doubleValue {
    double? x = preferences.getDouble(toString());
    if(x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setDouble(double value) {
    return preferences.setDouble(toString(), value);
  }

  List<String> get stringList {
    List<String>? x = preferences.getStringList(toString());
    if(x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setStringList(List<String> value) {
    return preferences.setStringList(toString(), value);
  }
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
