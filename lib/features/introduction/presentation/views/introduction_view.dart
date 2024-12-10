import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff255685),
      body: Center(
        child: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.studentOrOwner);
            },
            icon: Icon(Icons.arrow_circle_left)),
      ),
    );
  }
}
