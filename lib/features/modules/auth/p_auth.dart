part of 'r_auth.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
              onPressed: () async {
                String s = CSettings.selectedTheme.stringValue;
                await locator<ThemesModule>().setTheme((s == CThemes.dark.toString())
                    ? CThemes.light
                    : CThemes.dark);
                context.go("/");
              },
              icon: Icon(Icons.abc),
              label: const Text("Change Theme"))
      ],
    );
  }
}