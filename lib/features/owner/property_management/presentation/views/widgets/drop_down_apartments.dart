import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/add_room_cubit/add_room_cubit.dart';

class DropDownApartments extends StatelessWidget {
  const DropDownApartments({super.key, required this.apartments});
  final List<ApartmentModel> apartments;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddRoomCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Apartment",
          style: AppStyles.stylesMedium18,
        ),
        SizedBox(
          height: 16,
        ),
        DropdownButtonFormField<int>(
          value: cubit.selectedValueFromDropdownList,
          items: List.generate(
            apartments.length,
            (index) {
              return DropdownMenuItem(
                child: Text(apartments[index].titledto!),
                value: apartments[index].id,
              );
            },
          ),
          onChanged: (newValue) {
            cubit.selectedValueFromDropdownList = newValue!;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kcolorOfTextField),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kcolorOfTextField),
            ),
          ),
        ),
      ],
    );
  }
}
