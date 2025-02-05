import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/a_exceptions.dart';

class ApiBase {
  Uri getBackendUri(String endpoint, {Map<String, String>? params}) {
    return CSettings.backendIsSecure.boolValue
        ? Uri.https(CSettings.serverLink.stringValue, endpoint, params ?? {})
        : Uri.http(CSettings.serverLink.stringValue, endpoint, params ?? {});
  }

  http.Response afterSend(http.Response response) {
    return response;
  }

  Future<http.Response> beforeSend(Future<http.Response> request) async {
    try {
      return await request;
    } on SocketException catch (e) {
      throw BackendException("Connection refused", endpoint: e.address.toString());
    }
  }

  void validateResponse(http.Response response) {
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw BackendException("Unauthorized");
    } else {
      throw BackendException("Failed to load data", endpoint: response.request?.url.path, statusCode: response.statusCode, method: response.request?.method);
    }
  }

  Future<http.Response> post({
    required Map<String, String> params,
    String endpoint = "/",
  }) async {
    final request = http.post(
      getBackendUri(endpoint),
      headers: CSettings.serverHeaders.stringMapValue(),
      body: params,
    );
    final response = await beforeSend(request);
    validateResponse(response);
    return afterSend(response);
  }

  Future<http.Response> put({
    required Map<String, String> params,
    String endpoint = "/",
  }) async {
    final request = http.put(
      getBackendUri(endpoint),
      headers: CSettings.serverHeaders.stringMapValue(),
      body: params,
    );
    final response = await beforeSend(request);
    validateResponse(response);
    return afterSend(response);
  }

  Future<http.Response> get({
    required Map<String, String> params,
    String endpoint = "/",
  }) async {
    final request = http.get(
      getBackendUri(endpoint, params: params),
      headers: CSettings.serverHeaders.stringMapValue(),
    );
    final response = await beforeSend(request);
    validateResponse(response);
    return afterSend(response);
  }

  Future<http.Response> delete({
    required Map<String, String> params,
    String endpoint = "/",
  }) async {
    final request = http.delete(
      getBackendUri(endpoint),
      headers: CSettings.serverHeaders.stringMapValue(),
      body: params,
    );
    final response = await beforeSend(request);
    validateResponse(response);
    return afterSend(response);
  }
}