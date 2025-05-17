import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';

class UniversityWidget extends StatelessWidget {
  const UniversityWidget({super.key});

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
              "Mansoura University",
              style: AppStyles.stylesMedium18,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
