import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo_imp.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_apartment_body.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/edit_apartment_cubit/edit_apartment_cubit.dart';

class EditApartmentView extends StatelessWidget {
  const EditApartmentView({super.key, required this.apartmentModel});
  final ApartmentModel apartmentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) =>
            EditApartmentCubit(getIt.get<PropertyManageRepoImp>())
              ..fetchApartment(apartment_model: apartmentModel),
        child: EditApartmentBody(
          apartmentModel: apartmentModel,
        ),
      ),
    );
  }
}
