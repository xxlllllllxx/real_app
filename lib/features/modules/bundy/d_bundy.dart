import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/a_exceptions.dart';

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
