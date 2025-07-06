import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

part 'property_manage_state.dart';

class PropertyManageCubit extends Cubit<PropertyManageState> {
  PropertyManageCubit(this.propertyManageRepo) : super(PropertyManageInitial());

  final PropertyManageRepo propertyManageRepo;
  bool isRoom = false;

  List<ApartmentModel> apartmentList = [];
  List<RoomModel> allRooms = [];

  late int comingOwnerId;

  Future<void> getApartments() async {
    emit(PropertyManageLoading());
    var response =
        await propertyManageRepo.getApartment(ownerId: comingOwnerId);
    response.fold(
      (failure) {
        emit(PropertyManageFailure(errmsg: failure.errmsg));
      },
      (apartments) {
        apartmentList = apartments;
        emit(PropertyManageSuccessApartments(apartmentList: apartments));
      },
    );
  }

  Future<void> fetchAllRoomsForOwner(int ownerId) async {
    emit(PropertyManageLoading());

    var response = await propertyManageRepo.getApartment(ownerId: ownerId);
    response.fold(
      (failure) {
        emit(PropertyManageFailure(errmsg: failure.errmsg));
      },
      (apartments) async {
        List<RoomModel> collectedRooms = [];
        for (var apartment in apartments) {
          var roomsResponse =
              await propertyManageRepo.getRooms(apartmentId: apartment.id!);

          roomsResponse.fold(
            (failure) {},
            (rooms) {
              collectedRooms.addAll(rooms);
            },
          );
        }

        allRooms = collectedRooms;
        emit(PropertyManageSuccessRooms(roomList: allRooms));
      },
    );
  }

  void toggleRoomOrApartment({required int ownerId}) {
    isRoom = !isRoom;
    if (isRoom) {
      fetchAllRoomsForOwner(ownerId);
    } else {
      getApartments();
    }
  }

  deleteApartment({required int apartmentId}) async {
    emit(PropertyManageLoading());
    var response =
        await propertyManageRepo.deleteApartment(apartmentId: apartmentId);

    response.fold((failure) {
      emit(PropertyManageFailure(errmsg: failure.errmsg));
    }, (map) async{
      emit(PropertyManagedeleteApartment(msg: map['message']));
      await getApartments();
    });
  }
}
