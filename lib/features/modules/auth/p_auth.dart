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
        Text(c_text_welcome_user),
        Text(c_text_username),
        Text(c_text_password),
        Text(c_text_login),
        
      ],
    );
  }
}