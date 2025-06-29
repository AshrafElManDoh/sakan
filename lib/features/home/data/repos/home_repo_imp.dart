import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/core/utils/api_service.dart';
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
}
