import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/login_body.dart';
import 'package:sakan/features/authentication/presentation/views_model/cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepoImp>()),
        child: LoginBody(),
      ),
    );
  }
}
