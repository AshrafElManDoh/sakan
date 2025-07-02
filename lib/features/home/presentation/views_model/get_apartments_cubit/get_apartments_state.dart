part of 'get_apartments_cubit.dart';

@immutable
sealed class GetApartmentsState {}

final class GetApartmentsInitial extends GetApartmentsState {}

final class GetApartmentsSuccess extends GetApartmentsState {
  final List<ApartmentModel> listOfApartment;

  GetApartmentsSuccess({required this.listOfApartment});
}

final class GetApartmentsFailure extends GetApartmentsState {
  final String errmsg;

  GetApartmentsFailure({required this.errmsg});
}

final class GetApartmentsLoading extends GetApartmentsState {}
