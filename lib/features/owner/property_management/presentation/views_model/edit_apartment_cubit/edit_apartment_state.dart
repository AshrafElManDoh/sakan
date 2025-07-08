part of 'edit_apartment_cubit.dart';

@immutable
sealed class EditApartmentState {}

final class EditApartmentInitial extends EditApartmentState {}

final class EditApartmentLoading extends EditApartmentState {}

final class EditApartmentFailure extends EditApartmentState {
  final String errmsg;

  EditApartmentFailure({required this.errmsg});
}

final class EditApartmentSuccess extends EditApartmentState {
  final String msg;

  EditApartmentSuccess({required this.msg});
}

final class EditApartmentPhotosSuccess extends EditApartmentState {
  final String msg;

  EditApartmentPhotosSuccess({required this.msg});
}

final class EditApartmentfetchApartment extends EditApartmentState {
  final String msg;

  EditApartmentfetchApartment({required this.msg});
}

final class EditApartmentLoadedLocation extends EditApartmentState {
  final String msg;

  EditApartmentLoadedLocation({required this.msg});
}
