part of 'get_rooms_cubit.dart';

@immutable
sealed class GetRoomsState {}

final class GetRoomsInitial extends GetRoomsState {}

final class GetRoomsLoading extends GetRoomsState {}

final class GetRoomsSuccess extends GetRoomsState {
  final List<RoomModel> listOfRooms;

  GetRoomsSuccess({required this.listOfRooms});
}

final class GetRoomsFailure extends GetRoomsState {
  final String errmsg;

  GetRoomsFailure({required this.errmsg});
}
