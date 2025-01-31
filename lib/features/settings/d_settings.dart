part of '../helpers/r_helper.dart';

var settings = throw UnimplementedError();

enum CSettings {
  databaseName,
  databasePath,
  databaseLink,
}

extension CXSettings on CSettings {
  String get stringValue {
    String? x = settings.getString(toString());
    if (x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setString(String value) {
    return settings.setString(toString(), value);
  }

  bool get boolValue {
    bool? x = settings.getBool(toString());
    if (x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setBool(bool value) {
    return settings.setBool(toString(), value);
  }

  int get intValue {
    int? x = settings.getInt(toString());
    if (x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setInt(int value) {
    return settings.setInt(toString(), value);
  }

  double get doubleValue {
    double? x = settings.getDouble(toString());
    if (x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setDouble(double value) {
    return settings.setDouble(toString(), value);
  }

  List<String> get stringList {
    List<String>? x = settings.getStringList(toString());
    if (x == null) {
      throw UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<bool> setStringList(List<String> value) {
    return settings.setStringList(toString(), value);
  }
}
