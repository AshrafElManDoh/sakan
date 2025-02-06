import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/authentication/presentation/views_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:sakan/features/authentication/presentation/views_model/register_cubit/register_cubit.dart';
import 'package:sakan/features/authentication/presentation/views_model/reset_password_cubit/reset_password_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const Sakan());
}

class Sakan extends StatelessWidget {
  const Sakan({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            getIt.get<AuthRepoImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(
            getIt.get<AuthRepoImp>(),
          ),
        ),BlocProvider(
          create: (context) => ResetPasswordCubit(
            getIt.get<AuthRepoImp>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          scaffoldBackgroundColor: kscaffoldColor,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
