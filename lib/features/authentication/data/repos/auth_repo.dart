import 'package:dartz/dartz.dart';
import 'package:sakan/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure,String>> register({required String name,
  required String email,
  required String password,
  required String confirm_Password,
  required String role,
  });
}