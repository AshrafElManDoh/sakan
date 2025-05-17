import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_widget.dart';

class ApartmentsListView extends StatelessWidget {
  const ApartmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => ApartmentWidget(),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: 6,
    );
  }
}
