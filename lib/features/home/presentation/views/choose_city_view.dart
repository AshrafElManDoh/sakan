import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/cities_grid_view.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_search_field.dart';

class ChooseCityView extends StatelessWidget {
  const ChooseCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomChooseText(
              text: "Choose Your Destination City",
            ),
            SizedBox(
              height: 64,
            ),
            CustomSearchField(),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: CitiesGridView(),
            )
          ],
        ),
      ),
    );
  }
}
