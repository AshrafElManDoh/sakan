import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/features/authentication/data/models/id_card_model/id_card_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register({
    required String name,
    required String email,
    required String password,
    required String confirm_Password,
    required String role,
  });
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required String email, required String password});
  Future<Either<Failure, String>> forgetPassword({required String email});
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, IdCardModel>> uploadId({required FormData formdata});
}
