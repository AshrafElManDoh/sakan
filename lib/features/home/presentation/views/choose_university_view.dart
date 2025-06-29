import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/home/data/repos/home_repo_imp.dart';
import 'package:sakan/features/home/presentation/views/widgets/choose_university_body.dart';
import 'package:sakan/features/home/presentation/views_model/get_universities_cubit/get_universities_cubit.dart';

class ChooseUniversityView extends StatelessWidget {
  const ChooseUniversityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => GetUniversitiesCubit(getIt.get<HomeRepoImp>())..getUniversities(),
        child: ChooseUniversityBody(),
      ),
    );
  }
}
