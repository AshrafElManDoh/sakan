import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/reset_password_body.dart';
import 'package:sakan/features/authentication/presentation/views_model/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(
          getIt.get<AuthRepoImp>(),
        ),
        child: ResetPasswordBody(
          email: email,
        ),
      ),
    );
  }
}
