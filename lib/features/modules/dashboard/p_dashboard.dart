part of 'r_dashboard.dart';
class DashbordUI extends StatelessWidget {
  const DashbordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("DASHBOARD"),
        locator<BundyModule>().getUI(CWidgets.cew_bundy),
      ],
    );
  }
}
