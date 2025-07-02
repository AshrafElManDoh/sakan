import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/home/data/repos/home_repo_imp.dart';
import 'package:sakan/features/home/presentation/views/widgets/choose_college_body.dart';
import 'package:sakan/features/home/presentation/views_model/get_colleges_cubit/get_colleges_cubit.dart';

class ChooseCollegeView extends StatelessWidget {
  const ChooseCollegeView({super.key, required this.universityID});
  final int universityID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => GetCollegesCubit(getIt.get<HomeRepoImp>())
          ..getColleges(universityId: universityID),
        child: ChooseCollegeBody(),
      ),
    );
  }
}
