class ApplicationException implements Exception {
  final String message;
  final String? module;
  final String? method;
  ApplicationException(
    this.message, {
    this.module,
    this.method,
  }) {
    if (module != null) {
      print("Path: $module");
    }
    if (method != null) {
      print("Method: $method");
    }
  }
  @override
  String toString() {
    return "ApplicationException: $message${module != null ? '\n\tmodule: [$module]' : ''}${method != null ? '\n\tmethod: [$method]' : ''}";
  }
}

class BackendException implements Exception {
  final String message;
  final int? statusCode;
  final String? endpoint;
  final String? method;
  final Map<String, String>? params;
  BackendException(
    this.message, {
    this.endpoint,
    this.statusCode = 0,
    this.method,
    this.params,
  }) {
    if (endpoint != null) {
      print("endpoint: $endpoint");
    }
    if (method != null) {
      print("Method: $method");
    }
    if (params != null) {
      print("Params: $params");
    }
  }

  @override
  String toString() {
    return "BackendException: $message${statusCode != null ? '\n\tcode: [$statusCode]' : ''}${endpoint != null ? '\n\tendpoint: [$endpoint]' : ''}${method != null ? '\n\tmethod: [$method]' : ''}${params != null ? '\n\tparams: [$params]' : ''}";
  }
}

class UnimplementedException implements Exception {
  final String message;
  final String? module;
  UnimplementedException(
    this.message, {
    this.module,
  }) {
    if (module != null) {
      print("Path: $module");
    }
  }

  @override
  String toString() {
    return "UnimplementedException: $message${module != null ? '\n\tmodule: [$module]' : ''}";
  }
}

class SafeException implements Exception {}
