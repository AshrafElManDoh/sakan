part of 'property_manage_cubit.dart';

@immutable
sealed class PropertyManageState {}

final class PropertyManageInitial extends PropertyManageState {}

final class PropertyManageLoading extends PropertyManageState {}

final class PropertyManageFailure extends PropertyManageState {
  final String errmsg;

  PropertyManageFailure({required this.errmsg});
}

final class PropertyManageSuccessApartments extends PropertyManageState {
  final List<ApartmentModel> apartmentList;

  PropertyManageSuccessApartments({required this.apartmentList});
}

final class PropertyManagedeleteApartment extends PropertyManageState {
  final String msg;

  PropertyManagedeleteApartment({required this.msg});
}

final class PropertyManagedeleteRoom extends PropertyManageState {
  final String msg;

  PropertyManagedeleteRoom({required this.msg});
}

final class PropertyManageSuccessRooms extends PropertyManageState {
  final List<RoomModel> roomList;

  PropertyManageSuccessRooms({required this.roomList});
}
