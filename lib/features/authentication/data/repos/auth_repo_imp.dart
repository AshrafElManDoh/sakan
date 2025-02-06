import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/core/utils/api_service.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final ApiService apiService;

  AuthRepoImp({required this.apiService});
  @override
  Future<Either<Failure, String>> register({
    required String name,
    required String email,
    required String password,
    required String confirm_Password,
    required String role,
  }) async {
    Map<String, String> data = {
      "name": name,
      "email": email,
      "password": password,
      "confirm_Password": confirm_Password,
      "role": role,
    };
    try {
      var response = await apiService.post(endPoint: "Register", data: data);
      // log(response.toString());
      String msg = response.toString();
      return right(msg);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
    };
    try {
      var response = await apiService.post(endPoint: "Login", data: data);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(
      {required String email}) async {
    Map<String, String> data = {"email": email};
    try {
      var response =
          await apiService.post(endPoint: "ForgotPassword", data: data);
      return right(response.toString());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, String>> resetPassword({required String email,
   required String verificationCode,
    required String newPassword,
     required String confirmPassword}) async{
    Map<String ,String> data ={
      "email":email,
      "verificationCode":verificationCode,
      "newPassword":newPassword,
      "confirmPassword":confirmPassword,
    };
    try {
  var response= await apiService.post(endPoint: "ResetPassword", data: data,);

  return right(response);
} catch (e) {
  if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
}
  }

  
}
