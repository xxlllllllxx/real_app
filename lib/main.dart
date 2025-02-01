import 'package:flutter/material.dart';
import 'package:real_app/features/cd_router.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/d_widget.dart';
import 'package:real_app/helpers/f_app_state.dart';
import 'package:real_app/helpers/r_helper.dart';
import 'package:real_app/helpers/r_modules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHelpers(locator);
  await registerModules(locator);

  onAppLoadedParallel();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MainRouter.router,
      title: c_application_name,
      builder: (context, child) {
        print("BUILT");
        if (child == null) {
          return cw_progress;
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: null,
              body: child,
            );
          },
        );
      },
    );
  }
}
