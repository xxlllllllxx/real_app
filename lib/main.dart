import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_app/app/r_app.dart';
// import 'package:real_app/features/modules/app/r_app.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:real_app/helpers/r_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHelpers(locator);
  await registerModules(locator);


  runApp(BlocProvider(
    create: (_) => locator<AppCubit>(),
    child: const MainApp(),
    ),
  );
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
        if (child == null) {
          return cw_progress;
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            locator<AppModule>().start();
            return MaterialApp(
              theme: locator<ThemesModule>().theme,
              home: Scaffold(
                appBar: null,
                body: child,
              ),
            );
          },
        );
      },
    );
  }
}
