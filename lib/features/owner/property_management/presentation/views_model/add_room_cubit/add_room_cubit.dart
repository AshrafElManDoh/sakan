import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

part 'add_room_state.dart';

class AddRoomCubit extends Cubit<AddRoomState> {
  AddRoomCubit(this.propertyManageRepo) : super(AddRoomInitial());
  final PropertyManageRepo propertyManageRepo;

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<XFile>? images; // ✅ متغير لحفظ الصور المختارة
  List<ApartmentModel> apartmentList = [];
  final ImagePicker picker = ImagePicker();
  int? selectedValueFromDropdownList;

  // ✅ اختيار صور من المعرض
  Future<void> pickImages() async {
    images = await picker.pickMultiImage();
    emit(AddRoomPhotosSuccess(msg: "Images selected successfully"));
  }

  Future<void> getApartments({required int comingOwnerId}) async {
    emit(AddRoomLoading());
    var response =
        await propertyManageRepo.getApartment(ownerId: comingOwnerId);
    response.fold(
      (failure) {
        emit(AddRoomFailure(errmsg: failure.errmsg));
      },
      (apartments) {
        apartmentList = apartments;
        emit(AddRoomFetchApartments(apartments: apartmentList));
      },
    );
  }

  Future<void> addRoom(
      {required String title,
      required int price,
      required int apartmentId,
      required String description,
      required bool isAvailable}) async {
    emit(AddRoomLoading());
    // ✅ تأكد أن فيه صور
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

    // ✅ إعداد FormData
    FormData formData = FormData.fromMap({
      "pricePerMonth": price,
      "description": description,
      "title": title,
      "imageFiles": imageFiles, // ✅ هنا الصور
      "imagePaths": null, // سيبه أو شيله حسب الـ backend
      "apartmentId": apartmentId,
      "isAvailable": isAvailable
    });

    // ✅ استدعاء repo
    var response = await propertyManageRepo.postRoom(formdata: formData);
    response.fold(
      (failure) {
        emit(AddRoomFailure(errmsg: failure.errmsg));
      },
      (msg) {
        emit(AddRoomSuccess(msg: msg));
      },
    );
  }
}
