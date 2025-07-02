import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/home/data/repos/home_repo_imp.dart';
import 'package:sakan/features/home/presentation/views/widgets/home_body.dart';
import 'package:sakan/features/home/presentation/views_model/get_apartments_cubit/get_apartments_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        // bottomNavigationBar: CustomBottomNavigationBar(),
        body: BlocProvider(
          create: (context) =>
              GetApartmentsCubit(getIt.get<HomeRepoImp>())..getApartment(),
          child: HomeBody(),
        ));
  }
}
