import 'dart:convert';

extension StringToObject on String {
  T toObject<T>() {
    try {
      return json.decode(this);
    } catch (e) {
      throw Exception("Invalid JSON string");
    }
  }
}
