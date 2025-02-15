import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_confirm_pass_text_field.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_otp.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_password_text_field.dart';
import 'package:sakan/features/authentication/presentation/views_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
        } else if (state is ResetPasswordSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(message: state.msg),
          );
          GoRouter.of(context).go(AppRouter.homeView);
        } else if (state is ResetPasswordFailure) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.errmsg),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
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
                    "Write code",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomOtp(
                    otpController: BlocProvider.of<ResetPasswordCubit>(context)
                        .otpController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Reset password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomPasswordTextField(
                    name: "Enter Password",
                    textEditingController:
                        BlocProvider.of<ResetPasswordCubit>(context)
                            .newpassController,
                    isLogin: false,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomConfirmPassTextField(
                    name: "Confirm Password",
                    textEditingController:
                        BlocProvider.of<ResetPasswordCubit>(context)
                            .confirmPassController,
                    passController: BlocProvider.of<ResetPasswordCubit>(context)
                        .newpassController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  CustomButton(
                    name: "Confirm",
                    onTap: () {
                      BlocProvider.of<ResetPasswordCubit>(context)
                          .resetPassword(
                        email: email,
                        verificationCode:
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .otpController
                                .text,
                        newPassword:
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .newpassController
                                .text,
                        confirmPassword:
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .confirmPassController
                                .text,
                      );
                    },
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
