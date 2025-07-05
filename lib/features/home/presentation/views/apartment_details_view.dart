import 'package:flutter/material.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_details_body.dart';

class ApartmentDetailsView extends StatelessWidget {
  const ApartmentDetailsView({super.key, required this.apartmentModel});
  final ApartmentModel apartmentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: ApartmentDetailsBody(apartmentModel: apartmentModel),
    );
  }
}
