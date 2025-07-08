part of 'edit_room_cubit.dart';

@immutable
sealed class EditRoomState {}

final class EditRoomInitial extends EditRoomState {}

final class EditRoomFailure extends EditRoomState {
  final String errmsg;

  EditRoomFailure({required this.errmsg});
}

final class EditRoomSuccess extends EditRoomState {
  final String msg;

  EditRoomSuccess({required this.msg});
}

final class EditRoomPhotoSuccess extends EditRoomState {
  final String msg;

  EditRoomPhotoSuccess({required this.msg});
}

final class EditRoomFetchRoom extends EditRoomState {
  final String msg;

  EditRoomFetchRoom({required this.msg});
}

final class EditRoomFetchApartments extends EditRoomState {
  final List<ApartmentModel> apartments;

  EditRoomFetchApartments({required this.apartments});
}

final class EditRoomLoading extends EditRoomState {}

final class EditRoomSwitch extends EditRoomState {}
