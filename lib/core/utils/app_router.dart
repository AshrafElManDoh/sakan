import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/authentication/presentation/views/forget_password_view.dart';
import 'package:sakan/features/authentication/presentation/views/login_view.dart';
import 'package:sakan/features/authentication/presentation/views/otp_view.dart';
import 'package:sakan/features/authentication/presentation/views/reset_password_view.dart';
import 'package:sakan/features/authentication/presentation/views/sign_up_view.dart';
import 'package:sakan/features/authentication/presentation/views/student_or_owner_view.dart';
import 'package:sakan/features/authentication/presentation/views/upload_id_card_view.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/home/data/repos/home_repo_imp.dart';
import 'package:sakan/features/home/presentation/views/apartment_details_view.dart';
import 'package:sakan/features/home/presentation/views/choose_college_view.dart';
import 'package:sakan/features/home/presentation/views/choose_university_view.dart';
import 'package:sakan/features/home/presentation/views/home_view.dart';
import 'package:sakan/features/home/presentation/views/main_view.dart';
import 'package:sakan/features/home/presentation/views/room_details_view.dart';
import 'package:sakan/features/home/presentation/views_model/get_ai_information_cubit/get_ai_information_cubit.dart';
import 'package:sakan/features/home/presentation/views_model/get_rooms_cubit/get_rooms_cubit.dart';
import 'package:sakan/features/introduction/presentation/views/introduction_view.dart';
import 'package:sakan/features/map/presentation/views/map_view.dart';
import 'package:sakan/features/owner/booking_request/presentation/views/booking_requests_view.dart';
import 'package:sakan/features/owner/dashboard/presentation/views/dashboard_view.dart';
import 'package:sakan/features/owner/profile/presentation/views/owner_profile_view.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo_imp.dart';
import 'package:sakan/features/owner/property_management/presentation/views/add_apartment_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/property_management_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/add_room_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_apartment_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_room_view.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/property_manage_cubit/property_manage_cubit.dart';
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
  static const uploadIdCardView = '/uploadIdCardView';

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
    initialLocation: studentOrOwner,
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
                path: AppRouter.apartmentDetailsView,
                builder: (context, state) {
                  final apartmentModel = state.extra as ApartmentModel;
                  return BlocProvider(
                    create: (context) {
                      final cubit = GetRoomsCubit(getIt.get<HomeRepoImp>());
                      cubit.id = apartmentModel.id;
                      cubit.getRooms();
                      return cubit;
                    },
                    child: ApartmentDetailsView(apartmentModel: apartmentModel),
                  );
                },
                routes: [
                  GoRoute(
                    path: AppRouter.roomDetailsView,
                    builder: (context, state) => BlocProvider(
                      create: (context) =>
                          GetAiInformationCubit(getIt.get<HomeRepoImp>()),
                      child: RoomDetailsView(
                        roomModel: state.extra as RoomModel,
                      ),
                    ),
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
                      child: BlocProvider(
                        create: (context) => PropertyManageCubit(
                            getIt.get<PropertyManageRepoImp>()),
                        child: PropertyManagementView(),
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: addApartmentView,
                    builder: (context, state) => AddApartmentView(),
                  ),
                  GoRoute(
                    path: editApartmentView,
                    builder: (context, state) => EditApartmentView(
                      apartmentModel: state.extra as ApartmentModel,
                    ),
                  ),
                  GoRoute(
                    path: editRoomView,
                    builder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>;
                      final roomModel = extra["room"] as RoomModel;
                      final ownerId = extra["ownerId"] as int;
                      return EditRoomView(
                          roomModel: roomModel, ownerid: ownerId);
                    },
                  ),
                  GoRoute(
                    path: addRoomView,
                    builder: (context, state) => AddRoomView(
                      ownerId: state.extra as int,
                    ),
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
                child: OwnerProfileView(),
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
      GoRoute(
        path: uploadIdCardView,
        builder: (context, state) => const UploadIdCardView(),
      ),
    ],
  );
}
