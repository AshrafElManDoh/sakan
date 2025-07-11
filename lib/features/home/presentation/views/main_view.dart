import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatelessWidget {
  final Widget child;
  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = 0;
    if (location.startsWith(AppRouter.mapView)) {
      currentIndex = 1;
    } else if (location.startsWith(AppRouter.chatBotView)) {
      currentIndex = 2;
    } else if (location.startsWith(AppRouter.searchView)) {
      currentIndex = 3;
    } else if (location.startsWith(AppRouter.profileView)) {
      currentIndex = 4;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRouter.homeView);
              break;
            case 1:
              context.go(AppRouter.mapView);
              break;
            case 2:
              context.go(AppRouter.chatBotView);
              break;
            case 3:
              context.go(AppRouter.searchView);
              break;
            case 4:
              context.go(AppRouter.profileView);
              break;
          }
        },
      ),
    );
  }
}
