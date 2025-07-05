import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo_imp.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/add_apartment_body.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/add_apartment_cubit/add_apartment_cubit.dart';

class AddApartmentView extends StatelessWidget {
  const AddApartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) =>
            AddApartmentCubit(getIt.get<PropertyManageRepoImp>()),
        child: AddApartmentBody(),
      ),
    );
  }
}
