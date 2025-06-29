import 'package:dartz/dartz.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/features/home/data/models/university_model/university_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<UniversityModel>>> getUniversities();
}