import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SafeArea(child: SignUpBody()),
    );
  }
}