import 'package:flutter/material.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_widget.dart';

class ApartmentsListView extends StatelessWidget {
  const ApartmentsListView({super.key, required this.apartments});
  final List<ApartmentModel> apartments;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => ApartmentWidget(
        apartmentModel: apartments[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: apartments.length,
    );
  }
}
