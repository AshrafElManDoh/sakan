import 'package:go_router/go_router.dart';
import 'package:sakan/features/authentication/presentation/views/student_or_owner_view.dart';
import 'package:sakan/features/introduction/presentation/views/introduction_view.dart';

abstract class AppRouter {
  static const studentOrOwner = '/studentOrOwner';
  static const introductionView = '/';
  static final router = GoRouter(routes: [
    GoRoute(
      path: studentOrOwner,
      builder: (context, state) => const StudentOrOwnerView(),
    ),
    GoRoute(
      path: introductionView,
      builder: (context, state) => const IntroductionView(),
    )
  ]);
}
