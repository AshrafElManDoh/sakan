import 'package:dartz/dartz.dart';
import 'package:sakan/core/errors/failure.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<ApartmentModel>>> searchApartment();
}