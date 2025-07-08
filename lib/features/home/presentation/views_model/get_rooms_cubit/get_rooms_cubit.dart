import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/home/data/repos/home_repo.dart';

part 'get_rooms_state.dart';

class GetRoomsCubit extends Cubit<GetRoomsState> {
  GetRoomsCubit(this.homeRepo) : super(GetRoomsInitial());
  final HomeRepo homeRepo;

  int? id;

  Future<void> getRooms() async {
    emit(GetRoomsLoading());
    var response = await homeRepo.getrooms(apartmentId: id!);
    response.fold(
      (failure) {
        emit(GetRoomsFailure(errmsg: failure.errmsg));
      },
      (rooms) {
        emit(GetRoomsSuccess(listOfRooms: rooms));
      },
    );
  }
}
