import 'package:real_app/helpers/a_http.dart';
import 'package:real_app/features/modules/bundy/d_bundy.dart';
import 'package:real_app/helpers/r_helper.dart';

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
