import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_break_line.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_confirm_pass_text_field.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_password_text_field.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_social.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLogoandName(),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Sign up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                name: "Enter Name",
                isEmail: false,
                textEditingController: nameController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                name: "Enter Email",
                isEmail: true,
                textEditingController: emailController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomPasswordTextField(
                name: "Enter Password",
                textEditingController: passController,
                isLogin: false,
              ),
              SizedBox(
                height: 16,
              ),
              CustomConfirmPassTextField(
                name: "Confirm Password",
                textEditingController: confirmPassController,
                passController: passController,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Color(0xff4F545A), fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.loginView);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 42,
              ),
              CustomButton(
                name: "Sign up",
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              SizedBox(
                height: 24,
              ),
              CustomBreakLine(),
              SizedBox(
                height: 36,
              ),
              CustomSocial(),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
