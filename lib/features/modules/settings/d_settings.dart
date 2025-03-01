part of 'r_settings.dart';

enum CSettings {
  backendIsSecure,

  serverLink,
  serverHeaders,

  selectedTheme,
}

Map<CSettings, dynamic> defaultSettings = {
  CSettings.backendIsSecure: c_temp_is_secure,
  CSettings.serverLink: c_temp_server_link,
  CSettings.serverHeaders: c_temp_headers,
  CSettings.selectedTheme: c_temp_selected_theme,
};

extension CXSettings on CSettings {
  bool get exists {
    return settings.read(toString()) != null;
  }

  bool get notExists {
    return settings.read(toString()) == null;
  }

  String get stringValue {
    String? x = settings.read(toString()) as String?;
    if (x == null) {
      return defaultSettings[this] ??
          UnimplementedException("${toString()} not found.");
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
      return defaultSettings[this] ??
          UnimplementedException("${toString()} not found.");
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
      return defaultSettings[this] ??
          UnimplementedException("${toString()} not found.");
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
      return defaultSettings[this] ??
          UnimplementedException("${toString()} not found.");
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
      return defaultSettings[this] ??
          UnimplementedException("${toString()} not found.");
    } else {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return jsonMap.map((key, value) => MapEntry(key, value.toString()));
    }
  }

  Future<void> setStringMap(Map<String, String> value) async {
    String jsonString = json.encode(value);
    await settings.write(toString(), jsonString);
  }
}
