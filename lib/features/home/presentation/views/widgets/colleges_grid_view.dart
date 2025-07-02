import 'package:flutter/material.dart';
import 'package:sakan/features/home/data/models/college_model/college_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/college_widget.dart';

class CollegesGridView extends StatelessWidget {
  const CollegesGridView({super.key, required this.colleges});
  final List<CollegeModel> colleges;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 28,
        crossAxisSpacing: 28,
        childAspectRatio: 176 / 153,
      ),
      itemCount: colleges.length,
      itemBuilder: (context, index) => CollegeWidget(
        college: colleges[index],
      ),
    );
  }
}
