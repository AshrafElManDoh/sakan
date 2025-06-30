// import 'package:go_router/go_router.dart';
// import 'package:sakan/features/authentication/presentation/views/forget_password_view.dart';
// import 'package:sakan/features/authentication/presentation/views/login_view.dart';
// import 'package:sakan/features/authentication/presentation/views/otp_view.dart';
// import 'package:sakan/features/authentication/presentation/views/reset_password_view.dart';
// import 'package:sakan/features/authentication/presentation/views/sign_up_view.dart';
// import 'package:sakan/features/authentication/presentation/views/student_or_owner_view.dart';
// import 'package:sakan/features/home/presentation/views/apartment_details_view.dart';
// import 'package:sakan/features/home/presentation/views/choose_city_view.dart';
// import 'package:sakan/features/home/presentation/views/choose_university_view.dart';
// import 'package:sakan/features/home/presentation/views/home_view.dart';
// import 'package:sakan/features/home/presentation/views/room_details_view.dart';
// import 'package:sakan/features/introduction/presentation/views/introduction_view.dart';
// import 'package:sakan/features/profile/presentation/views/profile_view.dart';
// import 'package:sakan/features/search/presentation/views/search_view.dart';

// abstract class AppRouter {
//   static const studentOrOwner = '/studentOrOwner';
//   // static const introductionView = '/';
//   static const introductionView = '/introductionView';
//   static const signUpView = '/signUp';
//   static const loginView = '/login';
//   static const forgetPasswordView = '/forgetPassword';
//   static const otpView = '/otp';
//   static const resetPasswordView = '/resetPassword';
//   static const chooseCityView = '/chooseCityView';
//   // static const chooseCityView = '/';
//   static const chooseUniverstiyView = '/chooseUniverstiyView';
//   // static const homeView = '/home';
//   static const homeView = '/';
//   // static const searchView = '/';
//   static const searchView = '/search';
//   static const profileView = '/profile';
//   // static const profileView = '/';
//   static const apartmentDetailsView = '/apartmentDetails';
//   static const roomDetailsView = '/roomDetailsView';

//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: studentOrOwner,
//         builder: (context, state) => const StudentOrOwnerView(),
//       ),
//       GoRoute(
//         path: chooseCityView,
//         builder: (context, state) => const ChooseCityView(),
//       ),
//       GoRoute(
//         path: chooseUniverstiyView,
//         builder: (context, state) => const ChooseUniversityView(),
//       ),
//       GoRoute(
//         path: introductionView,
//         builder: (context, state) => const IntroductionView(),
//       ),
//       GoRoute(
//         path: signUpView,
//         builder: (context, state) => SignUpView(
//           role: state.extra as String,
//         ),
//       ),
//       GoRoute(
//         path: loginView,
//         builder: (context, state) => const LoginView(),
//       ),
//       GoRoute(
//         path: forgetPasswordView,
//         builder: (context, state) =>const  ForgetPasswordView(),
//       ),
//       GoRoute(
//         path: otpView,
//         builder: (context, state) =>const  OtpView(),
//       ),
//       GoRoute(
//         path: resetPasswordView,
//         builder: (context, state) => ResetPasswordView(
//           email: state.extra as String,
//         ),
//       ),
//       GoRoute(
//         path: homeView,
//         builder: (context, state) =>const HomeView(),
//       ),
//       GoRoute(
//         path: searchView,
//         builder: (context, state) =>const SearchView(),
//       ),
//       GoRoute(
//         path: profileView,
//         builder: (context, state) =>const ProfileView(),
//       ),
//       GoRoute(
//         path: apartmentDetailsView,
//         builder: (context, state) =>const ApartmentDetailsView(),
//       ),
//       GoRoute(
//         path: roomDetailsView,
//         builder: (context, state) =>const RoomDetailsView(),
//       ),
//     ],
//   );
// }

import 'package:go_router/go_router.dart';
import 'package:sakan/features/authentication/presentation/views/forget_password_view.dart';
import 'package:sakan/features/authentication/presentation/views/login_view.dart';
import 'package:sakan/features/authentication/presentation/views/otp_view.dart';
import 'package:sakan/features/authentication/presentation/views/reset_password_view.dart';
import 'package:sakan/features/authentication/presentation/views/sign_up_view.dart';
import 'package:sakan/features/authentication/presentation/views/student_or_owner_view.dart';
import 'package:sakan/features/home/presentation/views/apartment_details_view.dart';
import 'package:sakan/features/home/presentation/views/choose_college_view.dart';
import 'package:sakan/features/home/presentation/views/choose_university_view.dart';
import 'package:sakan/features/home/presentation/views/home_view.dart';
import 'package:sakan/features/home/presentation/views/main_view.dart';
import 'package:sakan/features/home/presentation/views/room_details_view.dart';
import 'package:sakan/features/introduction/presentation/views/introduction_view.dart';
import 'package:sakan/features/map/presentation/views/map_view.dart';
import 'package:sakan/features/owner/booking_request/presentation/views/booking_requests_view.dart';
import 'package:sakan/features/owner/dashboard/presentation/views/dashboard_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/add_apartment_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/property_management_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/add_room_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_apartment_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_room_view.dart';
import 'package:sakan/features/profile/presentation/views/profile_view.dart';
import 'package:sakan/features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const studentOrOwner = '/studentOrOwner';
  static const introductionView = '/introductionView';
  static const signUpView = '/signUp';
  static const loginView = '/login';
  static const forgetPasswordView = '/forgetPassword';
  static const otpView = '/otp';
  static const resetPasswordView = '/resetPassword';
  static const chooseCollegeView = '/chooseCityView';
  static const chooseUniverstiyView = '/chooseUniverstiyView';

  // ShellRoute paths
  static const homeView = '/home';
  static const mapView = '/map';
  static const searchView = '/search';
  static const profileView = '/profile';

  // Nested paths
  static const apartmentDetailsView = 'apartmentDetails';
  static const roomDetailsView = 'roomDetails';

  //shellRoute paths for owner
  static const propertyManagementView = '/propertyManagement';
  static const bookingRequestsView = '/bookingRequests';
  static const ownerProfileView = '/ownerProfile';
  //nested paths
  static const addApartmentView = 'addApartment';
  static const editApartmentView = 'editApartment';
  static const editRoomView = 'editRoom';
  static const addRoomView = 'addRoom';

  static final router = GoRouter(
    initialLocation: chooseUniverstiyView,
    routes: [
      // ✅ ShellRoute for pages with BottomNavigationBar
      ShellRoute(
        builder: (context, state, child) => MainView(child: child),
        routes: [
          GoRoute(
            path: homeView,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeView()),
            routes: [
              GoRoute(
                path: apartmentDetailsView,
                builder: (context, state) => const ApartmentDetailsView(),
                routes: [
                  GoRoute(
                    path: roomDetailsView,
                    builder: (context, state) => const RoomDetailsView(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: mapView,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MapView()),
          ),
          GoRoute(
            path: searchView,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SearchView()),
          ),
          GoRoute(
            path: profileView,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileView()),
          ),
        ],
      ),
      // ShellRoute for owner
      ShellRoute(
          builder: (context, state, child) => DashboardView(child: child),
          routes: [
            GoRoute(
                path: propertyManagementView,
                pageBuilder: (context, state) => NoTransitionPage(
                      child: PropertyManagementView(),
                    ),
                routes: [
                  GoRoute(
                    path: addApartmentView,
                    builder: (context, state) => AddApartmentView(),
                  ),
                  GoRoute(
                    path: editApartmentView,
                    builder: (context, state) => EditApartmentView(),
                  ),
                  GoRoute(
                    path: editRoomView,
                    builder: (context, state) => EditRoomView(),
                  ),
                  GoRoute(
                    path: addRoomView,
                    builder: (context, state) => AddRoomView(),
                  ),
                ]),
            GoRoute(
              path: bookingRequestsView,
              pageBuilder: (context, state) => NoTransitionPage(
                child: BookingRequestsView(),
              ),
            ),
            GoRoute(
              path: ownerProfileView,
              pageBuilder: (context, state) => NoTransitionPage(
                child: ProfileView(),
              ),
            ),
          ]),

      // ✅ Other routes outside BottomNavigationBar layout
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
        builder: (context, state) => SignUpView(
          role: state.extra as String,
        ),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: otpView,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: resetPasswordView,
        builder: (context, state) => ResetPasswordView(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        path: chooseCollegeView,
        builder: (context, state) => ChooseCollegeView(
          universityID: state.extra as int,
        ),
      ),
      GoRoute(
        path: chooseUniverstiyView,
        builder: (context, state) => const ChooseUniversityView(),
      ),
    ],
  );
}
