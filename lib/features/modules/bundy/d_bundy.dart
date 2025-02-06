part of 'r_bundy.dart';

class Bundy extends SerialObject {
  Bundy();

  factory Bundy.fromJson(Map<String, String> json) {
    return Bundy();
  }

  @override
  Map<String, String> toJson() {
    throw UnimplementedException("In d_bundy");
  }
}
