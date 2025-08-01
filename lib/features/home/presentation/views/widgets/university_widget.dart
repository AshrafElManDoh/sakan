import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_prefs_helper.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/university_model/university_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UniversityWidget extends StatelessWidget {
  const UniversityWidget({super.key, required this.university});
  final UniversityModel university;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppPrefsHelper.keyUniversity, university.name!);
        GoRouter.of(context)
            .push(AppRouter.chooseCollegeView, extra: university.id);
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
              university.name!,
              style: AppStyles.stylesMedium18,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
