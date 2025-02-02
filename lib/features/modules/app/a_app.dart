import 'package:real_app/helpers/a_http.dart';

class AppApi extends ApiBase {
  List<String> access = [];

  String path = "/app";

  Future<bool> checkBackendConnection() async {
    var response = await post(params: {});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
