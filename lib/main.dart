import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_prefs_helper.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  final initialRoute = await AppPrefsHelper.getInitialRoute();
  runApp(Sakan(
    initialRoute: initialRoute,
  ));
}

class Sakan extends StatelessWidget {
  const Sakan({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerWithInitialRoute(initialRoute),
      theme: ThemeData(
        scaffoldBackgroundColor: kscaffoldColor,
        fontFamily: "Poppins",
      ),
    );
  }
}
