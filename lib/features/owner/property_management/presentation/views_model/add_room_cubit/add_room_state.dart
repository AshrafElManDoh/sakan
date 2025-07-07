part of 'add_room_cubit.dart';

@immutable
sealed class AddRoomState {}

final class AddRoomInitial extends AddRoomState {}

final class AddRoomLoading extends AddRoomState {}

final class AddRoomFailure extends AddRoomState {
  final String errmsg;

  AddRoomFailure({required this.errmsg});
}

final class AddRoomPhotosSuccess extends AddRoomState {
  final String msg;

  AddRoomPhotosSuccess({required this.msg});
}

final class AddRoomSuccess extends AddRoomState {
  final String msg;

  AddRoomSuccess({required this.msg});
}

final class AddRoomFetchApartments extends AddRoomState {
  final List<ApartmentModel> apartments;

  AddRoomFetchApartments({required this.apartments});
}
