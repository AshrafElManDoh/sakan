import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_search_field.dart';
import 'package:sakan/features/home/presentation/views/widgets/universities_grid_view.dart';

class ChooseUniversityView extends StatelessWidget {
  const ChooseUniversityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomChooseText(text: "Choose the name of your University"),
            SizedBox(
              height: 64,
            ),
            CustomSearchField(),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: UniversitiesGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
