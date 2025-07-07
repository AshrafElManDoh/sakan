import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/core/utils/api_service.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

class PropertyManageRepoImp implements PropertyManageRepo {
  final ApiService apiService;

  PropertyManageRepoImp({required this.apiService});

  @override
  Future<Either<Failure, String>> postApartment(
      {required FormData formdata}) async {
    try {
      var response =
          await apiService.post(endPoint: "Apartment", data: formdata);
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
  Future<Either<Failure, String>> postRoom({required FormData formdata}) async {
    try {
      await apiService.post(endPoint: "Rooms", data: formdata);
      return right("Room added Successfully !");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ApartmentModel>>> getApartment(
      {required int ownerId}) async {
    try {
      var response = await apiService.get(
          endPoint: "Apartment/ByOwner", queryParams: {"ownerId": ownerId});
      List<ApartmentModel> apartments = [];
      for (var apartment in response) {
        apartments.add(ApartmentModel.fromJson(apartment));
      }
      return right(apartments);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<RoomModel>>> getRooms(
      {required int apartmentId}) async {
    try {
      var response = await apiService.get(
          endPoint: "Rooms/InApartment",
          queryParams: {"apartmentId": apartmentId});
      List<RoomModel> rooms = [];
      for (var room in response) {
        rooms.add(RoomModel.fromJson(room));
      }
      return right(rooms);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> editAparment(
      {required FormData formdata, required int apartmentId}) async {
    try {
      var response = await apiService.put(
          endPoint: "Apartment/$apartmentId", data: formdata);
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
  Future<Either<Failure, Map<String, dynamic>>> deleteApartment(
      {required int apartmentId}) async {
    try {
      var response =
          await apiService.delete(endPoint: "Apartment/$apartmentId");
      Map<String, dynamic> map = response;
      return right(map);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> editRoom(
      {required FormData formdata, required int roomId}) async {
    try {
      await apiService.put(endPoint: "Rooms/$roomId", data: formdata);
      return right("Room is edited successfully !");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }
}
