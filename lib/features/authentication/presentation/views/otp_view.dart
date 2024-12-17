import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/otp_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true,),
      body: OtpBody(),
    );
  }
}