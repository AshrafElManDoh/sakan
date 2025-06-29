import 'package:flutter/material.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_apartment_body.dart';

class EditApartmentView extends StatelessWidget {
  const EditApartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: EditApartmentBody(),
    );
  }
}
