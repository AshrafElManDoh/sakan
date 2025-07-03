import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sakan/core/utils/api_service.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:sakan/features/home/data/repos/home_repo_imp.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImp>(
    AuthRepoImp(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<PropertyManageRepoImp>(
    PropertyManageRepoImp(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
