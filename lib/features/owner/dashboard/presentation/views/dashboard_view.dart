import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/owner/dashboard/presentation/views/widgets/custom_owner_nav_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = 0;
    if (location.startsWith(AppRouter.bookingRequestsView)) {
      currentIndex = 1;
    } else if (location.startsWith(AppRouter.ownerProfileView)) {
      currentIndex = 2;
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomOwnerNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRouter.propertyManagementView);
              break;
            case 1:
              context.go(AppRouter.bookingRequestsView);
              break;
            case 2:
              context.go(AppRouter.ownerProfileView);
              break;
          }
        },
      ),
    );
  }
}
