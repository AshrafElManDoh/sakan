import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_router.dart';

void main() {
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
        scaffoldBackgroundColor: Color(0xffF2F2F2),
        fontFamily: "Poppins",
      ),
    );
  }
}
