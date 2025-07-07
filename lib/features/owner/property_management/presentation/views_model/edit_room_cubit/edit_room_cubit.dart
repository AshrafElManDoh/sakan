import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

part 'edit_room_state.dart';

class EditRoomCubit extends Cubit<EditRoomState> {
  EditRoomCubit(this.propertyManageRepo) : super(EditRoomInitial());
  final PropertyManageRepo propertyManageRepo;
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late int selectedValueFromDropdownList;
  late bool isAvailable;
  List<XFile>? images;
  List<ApartmentModel> apartmentList = [];
  final ImagePicker picker = ImagePicker();
  Future<void> pickImages() async {
    images = await picker.pickMultiImage();
    emit(EditRoomPhotoSuccess(msg: "Images selected successfully"));
  }

  Future<void> getApartments({required int comingOwnerId}) async {
    emit(EditRoomLoading());
    var response =
        await propertyManageRepo.getApartment(ownerId: comingOwnerId);
    response.fold(
      (failure) {
        emit(EditRoomFailure(errmsg: failure.errmsg));
      },
      (apartments) {
        apartmentList = apartments;
        emit(EditRoomFetchApartments(apartments: apartmentList));
      },
    );
  }

  fetchRoom({required RoomModel room_model, required int comingOwnerId}) async {
    emit(EditRoomLoading());
    try {
      titleController.text = room_model.title ?? "No Title";
      priceController.text = room_model.pricePerMonth.toString();
      descriptionController.text = room_model.description ?? "No description";
      await getApartments(comingOwnerId: comingOwnerId);
      emit(EditRoomFetchRoom(msg: "Room is loaded Successfully "));
    } catch (e) {
      emit(EditRoomFailure(errmsg: "Failed!"));
    }
  }

  switchIsAvailable() {
    isAvailable = !isAvailable;
    emit(EditRoomSwitch());
  }

  editRoom({
    required String title,
    required String description,
    required int price,
    required bool isAvailable,
    required int apartmentId,
    required int roomId,
  }) async {
    emit(EditRoomLoading());
    List<MultipartFile> imageFiles = [];
    if (images != null && images!.isNotEmpty) {
      imageFiles = await Future.wait(
        images!.map((image) async {
          return await MultipartFile.fromFile(
            image.path,
            filename: image.name,
          );
        }),
      );
    }
    FormData formData = FormData.fromMap({
      "pricePerMonth": price,
      "description": description,
      "imageFiles": imageFiles,
      "imagePaths": null,
      "title": title,
      "isAvailable": isAvailable,
      "apartmentId": apartmentId,
    });
    var response =
        await propertyManageRepo.editRoom(formdata: formData, roomId: roomId);
    response.fold(
      (failure) {
        emit(EditRoomFailure(errmsg: failure.errmsg));
      },
      (msg) {
        emit(EditRoomSuccess(msg: msg));
      },
    );
  }
}
