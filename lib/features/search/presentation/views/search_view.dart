import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/search/data/repos/search_repo_imp.dart';
import 'package:sakan/features/search/presentation/views/widgets/search_body.dart';
import 'package:sakan/features/search/presentation/views_model/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImp>()),
          child: SearchBody(),
        ),
      ),
    );
  }
}
