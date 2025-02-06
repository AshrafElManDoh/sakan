import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: ResetPasswordBody(
        email: email,
      ),
    );
  }
}
