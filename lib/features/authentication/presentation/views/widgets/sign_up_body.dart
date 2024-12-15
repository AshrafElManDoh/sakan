import 'package:flutter/widgets.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLogoandName(),
          const SizedBox(height: 16,),
          Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ],
      ),
    );
  }
}