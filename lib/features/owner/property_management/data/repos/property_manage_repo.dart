import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';

abstract class PropertyManageRepo {
  Future<Either<Failure,String>> postApartment({required FormData formdata});
}