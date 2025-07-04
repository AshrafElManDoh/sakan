import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/upload_id_card_body.dart';
import 'package:sakan/features/authentication/presentation/views_model/upload_id_card_cubit/upload_id_card_cubit.dart';

class UploadIdCardView extends StatelessWidget {
  const UploadIdCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UploadIdCardCubit(getIt.get<AuthRepoImp>()),
        child: UploadIdCardBody(),
      ),
    );
  }
}
