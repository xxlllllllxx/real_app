part of 'r_app.dart';

class AppConnectionState extends StatelessWidget {
  const AppConnectionState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Connection Status");
  }
}

class AppConnectionStateUI extends StatelessWidget {
  const AppConnectionStateUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
      Card(
        child: Container(
          height: 400,
          width: 300,
          alignment: Alignment.center,
          child: const Text("Connection Input!"),
        ),
      ),
    ],
    );
  }
}

class AppSplash extends StatelessWidget {
  const AppSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: locator<ThemesModule>().splashColor,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("This is the splashscreen"),
        ],
      ),
    );
  }
}
