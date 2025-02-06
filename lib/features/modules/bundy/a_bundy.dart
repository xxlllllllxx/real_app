part of 'r_bundy.dart';
class BundyApi extends ApiBase {
  BundyApi();

  Future<Bundy> postBundy() async {
    final response = await post(
      endpoint: "/",
      params: {},
    );
    validateResponse(response);
    return response.body.toObject<Bundy>();
  }

  Future<void> refresh() {
    return post(endpoint: "/refresh", params: {});
  }
}
