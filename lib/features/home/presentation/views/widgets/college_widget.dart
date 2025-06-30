import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/college_model/college_model.dart';

class CollegeWidget extends StatelessWidget {
  const CollegeWidget({
    super.key,
    required this.college,
  });
  final CollegeModel college;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(AppRouter.homeView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: AspectRatio(
          aspectRatio: 176 / 153,
          child: Center(
            child: Text(
              college.name!,
              style: AppStyles.stylesMedium18,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
