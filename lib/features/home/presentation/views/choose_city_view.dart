import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/cities_grid_view.dart';

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
            Text(
              "Choose Your Destination City",
              style: AppStyles.stylesSemiBold30,
            ),
            SizedBox(
              height: 64,
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
