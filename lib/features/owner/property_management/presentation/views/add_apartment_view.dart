import 'package:flutter/material.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/add_apartment_body.dart';

class AddApartmentView extends StatelessWidget {
  const AddApartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: AddApartmentBody(),
    );
  }
}
