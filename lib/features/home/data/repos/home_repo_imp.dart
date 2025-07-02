import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/core/utils/api_service.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/college_model/college_model.dart';
import 'package:sakan/features/home/data/models/university_model/university_model.dart';
import 'package:sakan/features/home/data/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<UniversityModel>>> getUniversities() async {
    try {
      var response = await apiService.get(endPoint: "Universities");
      List<UniversityModel> universities = [];
      for (var university in response) {
        universities.add(UniversityModel.fromJson(university));
      }
      return right(universities);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CollegeModel>>> getColleges(
      {required int universityID}) async {
    try {
      var response = await apiService.get(endPoint: "Colleges", queryParams: {
        "universityId": universityID,
      });
      List<CollegeModel> colleges = [];
      for (var college in response) {
        colleges.add(CollegeModel.fromJson(college));
      }
      return right(colleges);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      } else {
        return left(ServerFailure(errmsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ApartmentModel>>> getApartments() async {
    try {
      var response = await apiService.get(endPoint: "Apartment");
      List<ApartmentModel> apartments = [];
      for (var apartment in response) {
        apartments.add(
          ApartmentModel.fromJson(apartment),
        );
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
}
