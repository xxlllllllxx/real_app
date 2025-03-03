part of 'r_settings.dart';

Map<LocalStorage, dynamic> defaultSettings = {
  LocalStorage.BACKEND_IS_SECURE: c_temp_is_secure,
  LocalStorage.SERVER_LINK: c_temp_server_link,
  LocalStorage.SERVER_HEADERS: c_temp_headers,
  LocalStorage.SELECTED_THEME: c_temp_selected_theme,
};



// extension CXSettings on LocalStorage {
//   bool get exists {
//     return settings.read(toString()) != null;
//   }

//   bool get notExists {
//     return settings.read(toString()) == null;
//   }

//   String get stringValue {
//     String? x = settings.read(toString()) as String?;
//     if (x == null) {
//       return defaultSettings[this] ??
//           UnimplementedException("${toString()} not found.");
//     } else {
//       return x;
//     }
//   }

//   Future<void> setString(String value) async {
//     await settings.(toString(), value);
//   }

//   bool get boolValue {
//     bool? x = settings.read(toString()) as bool?;
//     if (x == null) {
//       return defaultSettings[this] ??
//           UnimplementedException("${toString()} not found.");
//     } else {
//       return x;
//     }
//   }

//   Future<void> setBool(bool value) async {
//     await settings.write(toString(), value);
//   }

//   int get intValue {
//     int? x = settings.read(toString()) as int?;
//     if (x == null) {
//       return defaultSettings[this] ??
//           UnimplementedException("${toString()} not found.");
//     } else {
//       return x;
//     }
//   }

//   Future<void> setInt(int value) async {
//     await settings.write(toString(), value);
//   }

//   List<T> listValue<T>() {
//     String? jsonString = settings.read(toString()) as String?;
//     if (jsonString == null) {
//       return defaultSettings[this] ??
//           UnimplementedException("${toString()} not found.");
//     } else {
//       List<dynamic> jsonList = json.decode(jsonString);
//       return jsonList.cast<T>();
//     }
//   }

//   Future<void> setList<T>(List<T> value) async {
//     String jsonString = json.encode(value);
//     await settings.write(toString(), jsonString);
//   }

//   Map<String, String> stringMapValue() {
//     String? jsonString = settings.read(toString()) as String?;
//     if (jsonString == null) {
//       return defaultSettings[this] ??
//           UnimplementedException("${toString()} not found.");
//     } else {
//       Map<String, dynamic> jsonMap = json.decode(jsonString);
//       return jsonMap.map((key, value) => MapEntry(key, value.toString()));
//     }
//   }

//   Future<void> setStringMap(Map<String, String> value) async {
//     String jsonString = json.encode(value);
//     await settings.write(toString(), jsonString);
//   }
// }
