part of 'add_apartment_cubit.dart';

@immutable
sealed class AddApartmentState {}

final class AddApartmentInitial extends AddApartmentState {}

final class AddApartmentLoading extends AddApartmentState {}

final class AddLocationSuccess extends AddApartmentState {
  final String msg;

  AddLocationSuccess({required this.msg});
}

final class AddPhotosSuccess extends AddApartmentState {
  final String msg;

  AddPhotosSuccess({required this.msg});
}

final class AddApartmentSuccess extends AddApartmentState {
  final String msg;

  AddApartmentSuccess({required this.msg});
}

final class AddApartmentFailure extends AddApartmentState {
  final String errmsg;

  AddApartmentFailure({required this.errmsg});
}
