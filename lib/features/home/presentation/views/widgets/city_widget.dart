import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.chooseUniverstiyView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 176 / 125,
              child: Image.asset(
                "assets/icon/mansoura.png",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Mansoura",
              style: AppStyles.stylesMedium18,
            ),
          ],
        ),
      ),
    );
  }
}
