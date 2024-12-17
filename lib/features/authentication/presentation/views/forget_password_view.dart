import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(forceMaterialTransparency: true,),
        body: ForgetPasswordBody(),
    );
  }
}