import 'package:flutter/material.dart';
import 'package:sakan/features/home/data/models/university_model/university_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/university_widget.dart';

class UniversitiesGridView extends StatelessWidget {
  const UniversitiesGridView({super.key, required this.universities});
  final List<UniversityModel> universities;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 28,
        crossAxisSpacing: 28,
      ),
      itemBuilder: (context, index) => UniversityWidget(
        university: universities[index],
      ),
      itemCount: universities.length,
    );
  }
}
