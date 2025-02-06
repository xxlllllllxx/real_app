part of 'r_bundy.dart';
class BundyUI extends StatelessWidget {
  const BundyUI({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUNDY IS CALLED");
    return ElevatedButton(
        onPressed: () {
          locator<BundyModule>().refresh();
        },
        child: const Text("CALL EXCEPTION"));
  }
}
