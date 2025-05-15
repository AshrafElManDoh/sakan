import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/city_widget.dart';

class CitiesGridView extends StatelessWidget {
  const CitiesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 28,
        crossAxisSpacing: 28,
        childAspectRatio: 176 / 153,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => CityWidget(),
    );
  }
}
