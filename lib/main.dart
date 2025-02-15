import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const Sakan());
}

class Sakan extends StatelessWidget {
  const Sakan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: kscaffoldColor,
        fontFamily: "Poppins",
      ),
    );
  }
}
