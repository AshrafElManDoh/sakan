import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';

abstract class PropertyManageRepo {
  Future<Either<Failure, String>> postApartment({required FormData formdata});
  Future<Either<Failure, List<ApartmentModel>>> getApartment(
      {required int ownerId});
  Future<Either<Failure, List<RoomModel>>> getRooms({required int apartmentId});
}
