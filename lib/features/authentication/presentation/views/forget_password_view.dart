import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/forget_password_body.dart';
import 'package:sakan/features/authentication/presentation/views_model/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(
          getIt.get<AuthRepoImp>(),
        ),
        child: ForgetPasswordBody(),
      ),
    );
  }
}
