import 'package:real_app/features/modules/app/r_app.dart';
import 'package:real_app/helpers/r_helper.dart';

Future<void> onAppLoadedParallel() async {
  locator<AppModule>().onStartUp();
  return;
}
