import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/core/utils/api_service.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/search/data/repos/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<ApartmentModel>>> searchApartment() async {
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
