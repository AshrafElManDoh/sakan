import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:sakan/features/authentication/presentation/views_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
        } else if (state is ForgetPasswordSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(message: state.msg),
          );
          GoRouter.of(context).pushReplacement(
            AppRouter.resetPasswordView,
            extra: emailController.text,
          );
        } else if (state is ForgetPasswordFailure) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.errmsg),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPasswordLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLogoandName(),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Forget password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    height: 42,
                  ),
                  CustomButton(
                    name: "Send code",
                    onTap: () {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .forgetPassword(email: emailController.text);
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
