import 'package:http/http.dart' as http;
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/d_exceptions.dart';

abstract class ApiBase {
  String? backendServer;
  final String path = throw UnimplementedException("In a_http");

  ApiBase({this.backendServer});

  Uri getBackendUri(String endpoint, {Map<String, String>? params}) {
    return CSettings.backendIsSecure.boolValue
        ? Uri.https(CSettings.serverLink.stringValue, endpoint, params ?? {})
        : Uri.http(CSettings.serverLink.stringValue, endpoint, params ?? {});
  }

  void afterSend(http.Response e) {}
  Future<void> beforeSend(
      String method, Map<String, String> params, endpoint) async {
    return;
  }

  Future<Map<String, String>> validateResponse(http.Response response) async {
    if (response.statusCode == 200) {
      return response.headers;
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized");
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<http.Response> post({
    required Map<String, String> params,
    String endpoint = "/",
  }) {
    return beforeSend("POST", params, endpoint).then((_) => http
            .post(getBackendUri(endpoint),
                headers: CSettings.serverHeaders.stringMapValue(), body: params)
            .then((e) {
          afterSend(e);
          return e;
        }));
  }

  Future<http.Response> put({
    required Map<String, String> params,
    String endpoint = "/",
  }) {
    return beforeSend("PUT", params, endpoint).then((_) => http
            .put(getBackendUri(endpoint),
                headers: CSettings.serverHeaders.stringMapValue(), body: params)
            .then((e) {
          afterSend(e);
          return e;
        }));
  }

  Future<http.Response> get({
    required Map<String, String> params,
    String endpoint = "/",
  }) {
    return beforeSend("GET", params, endpoint).then((_) => http
            .get(getBackendUri(endpoint, params: params),
                headers: CSettings.serverHeaders.stringMapValue())
            .then((e) {
          afterSend(e);
          return e;
        }));
  }

  Future<http.Response> delete({
    required Map<String, String> params,
    String endpoint = "/",
  }) {
    return beforeSend("DELETE", params, endpoint).then((_) => http
            .delete(getBackendUri(endpoint),
                headers: CSettings.serverHeaders.stringMapValue(), body: params)
            .then((e) {
          afterSend(e);
          return e;
        }));
  }
}
