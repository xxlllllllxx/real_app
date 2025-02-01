part of './r_settings.dart';

enum CSettings {
  backendLink,
  backendIsSecure,

  serverLink,
  serverHeaders,
}

extension CXSettings on CSettings {
  String get stringValue {
    String? x = settings.read(toString()) as String?;
    if (x == null) {
      throw UnimplementedException("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<void> setString(String value) async {
    await settings.write(toString(), value);
  }

  bool get boolValue {
    bool? x = settings.read(toString()) as bool?;
    if (x == null) {
      throw UnimplementedException("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<void> setBool(bool value) async {
    await settings.write(toString(), value);
  }

  int get intValue {
    int? x = settings.read(toString()) as int?;
    if (x == null) {
      throw UnimplementedException("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<void> setInt(int value) async {
    await settings.write(toString(), value);
  }

  List<T> listValue<T>() {
    String? jsonString = settings.read(toString()) as String?;
    if (jsonString == null) {
      throw UnimplementedException("${toString()} not found.");
    } else {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.cast<T>();
    }
  }

  Future<void> setList<T>(List<T> value) async {
    String jsonString = json.encode(value);
    await settings.write(toString(), jsonString);
  }

  Map<String, String> stringMapValue() {
    String? jsonString = settings.read(toString()) as String?;
    if (jsonString == null) {
      throw UnimplementedException("${toString()} not found.");
    } else {
      return json.decode(jsonString) as Map<String, String>;
    }
  }

  Future<void> setStringMap(Map<String, String> value) async {
    String jsonString = json.encode(value);
    await settings.write(toString(), jsonString);
  }
}

abstract class SerialObject {
  SerialObject();
  Map<String, String> toJson();
  factory SerialObject.fromJson(Map<String, String> json) =>
      throw UnimplementedException("Needs to override fromJson");
}
