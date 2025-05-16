import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/university_widget.dart';

class UniversitiesGridView extends StatelessWidget {
  const UniversitiesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 28,
        crossAxisSpacing: 28,
      ),
      itemBuilder: (context, index) => UniversityWidget(),
      itemCount: 4,
    );
  }
}
