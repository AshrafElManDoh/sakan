import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/sign_up_body.dart';
import 'package:sakan/features/authentication/presentation/views_model/register_cubit/register_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(
          getIt.get<AuthRepoImp>(),
        ),
        child: SignUpBody(
          role: role,
        ),
      ),
    );
  }
}
