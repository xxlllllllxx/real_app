part of 'r_helper.dart';

class ApiBase {
  Uri getBackendUri(String endpoint, {Map<String, String>? params}) {
    return LocalStorage.BACKEND_IS_SECURE.boolValue
        ? Uri.https(
            LocalStorage.SERVER_LINK.stringValue, endpoint, params ?? {})
        : Uri.http(
            LocalStorage.SERVER_LINK.stringValue, endpoint, params ?? {});
  }

  http.Response afterSend(http.Response response) {
    return response;
  }

  Future<http.Response> beforeSend(Future<http.Response> request) async {
    try {
      return await request;
    } on SocketException catch (e) {
      throw BackendException("Connection failed",
          endpoint: e.address.toString());
    }
  }

  void validateResponse(http.Response response) {
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw BackendException("Unauthorized");
    } else {
      throw BackendException("Failed to load data",
          endpoint: response.request?.url.path,
          statusCode: response.statusCode,
          method: response.request?.method);
    }
  }

  Future<http.Response> post({
    required Map<String, String> params,
    String endpoint = "/",
    handleError = true,
    Uri? completeUri,
  }) async {
    final request = http.post(
      completeUri ?? getBackendUri(endpoint),
      headers: LocalStorage.SERVER_HEADERS.stringMapValue(),
      body: params,
    );
    if (handleError) {
      final response = await beforeSend(request);
      validateResponse(response);
      return afterSend(response);
    } else {
      return request;
    }
  }

  Future<http.Response> put({
    required Map<String, String> params,
    String endpoint = "/",
    handleError = true,
    Uri? completeUri,
  }) async {
    final request = http.put(
      completeUri ?? getBackendUri(endpoint),
      headers: LocalStorage.SERVER_HEADERS.stringMapValue(),
      body: params,
    );
    if (handleError) {
      final response = await beforeSend(request);
      validateResponse(response);
      return afterSend(response);
    } else {
      return request;
    }
  }

  Future<http.Response> get({
    required Map<String, String> params,
    String endpoint = "/",
    handleError = true,
    Uri? completeUri,
  }) async {
    final request = http.get(
      completeUri ?? getBackendUri(endpoint, params: params),
      headers: LocalStorage.SERVER_HEADERS.stringMapValue(),
    );
    if(handleError) {
      final response = await beforeSend(request);
      validateResponse(response);
      return afterSend(response);
    } else {
      return request;
    }
  }

  Future<http.Response> delete({
    required Map<String, String> params,
    String endpoint = "/",
    handleError = false,
    Uri? completeUri,
  }) async {
    final request = http.delete(
      completeUri ?? getBackendUri(endpoint),
      headers: LocalStorage.SERVER_HEADERS.stringMapValue(),
      body: params,
    );
    if(handleError) {
      final response = await beforeSend(request);
      validateResponse(response);
      return afterSend(response);
    } else {
      return request;
    }
  }
}
