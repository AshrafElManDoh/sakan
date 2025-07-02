import 'package:dartz/dartz.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/college_model/college_model.dart';
import 'package:sakan/features/home/data/models/university_model/university_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UniversityModel>>> getUniversities();
  Future<Either<Failure, List<CollegeModel>>> getColleges(
      {required int universityID});
  Future<Either<Failure, List<ApartmentModel>>> getApartments();
}
