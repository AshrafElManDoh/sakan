import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: LoginBody(),
    );
  }
}
