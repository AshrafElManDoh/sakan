import 'package:go_router/go_router.dart';
import 'package:sakan/features/authentication/presentation/views/forget_password_view.dart';
import 'package:sakan/features/authentication/presentation/views/login_view.dart';
import 'package:sakan/features/authentication/presentation/views/otp_view.dart';
import 'package:sakan/features/authentication/presentation/views/reset_password_view.dart';
import 'package:sakan/features/authentication/presentation/views/sign_up_view.dart';
import 'package:sakan/features/authentication/presentation/views/student_or_owner_view.dart';
import 'package:sakan/features/introduction/presentation/views/introduction_view.dart';

abstract class AppRouter {
  static const studentOrOwner = '/studentOrOwner';
  static const introductionView = '/';
  static const signUpView = '/signUp';
  static const loginView = '/login';
  static const forgetPasswordView = '/forgetPassword';
  static const otpView = '/otp';
  static const resetPasswordView = '/resetPassword';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: studentOrOwner,
        builder: (context, state) => const StudentOrOwnerView(),
      ),
      GoRoute(
        path: introductionView,
        builder: (context, state) => const IntroductionView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: forgetPasswordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: otpView,
        builder: (context, state) => OtpView(),
      ),
      GoRoute(
        path: resetPasswordView,
        builder: (context, state) => ResetPasswordView(),
      ),
    ],
  );
}
