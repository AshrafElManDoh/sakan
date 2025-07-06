import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:sakan/core/utils/location_service.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

part 'edit_apartment_state.dart';

class EditApartmentCubit extends Cubit<EditApartmentState> {
  EditApartmentCubit(this.propertyManageRepo) : super(EditApartmentInitial());
  final PropertyManageRepo propertyManageRepo;
  TextEditingController apartmentTitleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  List<String>? imagePaths;
  LocationService locationService = LocationService();
  List<XFile>? images; // 

  final ImagePicker picker = ImagePicker();

  
  Future<void> pickImages() async {
    images = await picker.pickMultiImage();
    emit(EditApartmentPhotosSuccess(msg: "Images selected successfully"));
  }
  Future<void> editApartment({
    required int id ,
    required String title,
    required int price,
    required int ownerID,
    required String description,
    required String location,
    required double latitude,
    required double longitude,
  }) async {
    emit(EditApartmentLoading());

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
      "pricePerMonthdto": price,
      "descriptiondto": description,
      "titledto": title,
      "imageFiles": imageFiles, // ✅ هنا الصور
      "imagePaths": null, // سيبه أو شيله حسب الـ backend
      "locationdto": location,
      "latitudedto": latitude,
      "longitudedto": longitude,
      "owner_id": ownerID,
    });

    // ✅ استدعاء repo
    var response = await propertyManageRepo.editAparment(formdata: formData,apartmentId: id);
    response.fold(
      (failure) {
        emit(EditApartmentFailure(errmsg: failure.errmsg));
      },
      (msg) {
        emit(EditApartmentSuccess(msg: msg));
      },
    );
  }

  fetchApartment({required ApartmentModel apartment_model}) {
    emit(EditApartmentLoading());
    try {
      apartmentTitleController.text = apartment_model.titledto ?? "No Title";
      priceController.text = apartment_model.pricePerMonthdto.toString();
      descriptionController.text =
          apartment_model.descriptiondto ?? "No description";
      locationController.text = apartment_model.locationdto ?? "No Location";
      latitudeController.text = apartment_model.latitudedto.toString();
      longitudeController.text = apartment_model.longitudedto.toString();
      imagePaths = apartment_model.imagePaths;
      emit(EditApartmentfetchApartment(
          msg: "Apartment is loaded Successfully "));
    } catch (e) {
      emit(EditApartmentFailure(errmsg: "Failed!"));
    }
  }

  getMyLocation() async {
    emit(EditApartmentLoading());
    LocationData myLocation = await locationService.getMyLocation();
    double lat = myLocation.latitude!;
    double lng = myLocation.longitude!;
    latitudeController.text = lat.toString();
    longitudeController.text = lng.toString();
    await getGovernorateFromCoordinates(lat, lng);
    emit(EditApartmentLoadedLocation(msg: "location is Loaded successfully"));
  }

  // ✅ تحويل الإحداثيات إلى اسم محافظة
  Future<void> getGovernorateFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationController.text = "${place.locality} ${place.country}";
      }
    } catch (e) {
      print("خطأ أثناء تحديد الموقع: $e");
    }
  }
}
