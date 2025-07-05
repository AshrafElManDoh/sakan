// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart';
// import 'package:sakan/core/utils/location_service.dart';
// import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

// part 'add_apartment_state.dart';

// class AddApartmentCubit extends Cubit<AddApartmentState> {
//   AddApartmentCubit(this.propertyManageRepo) : super(AddApartmentInitial());
//   final PropertyManageRepo propertyManageRepo;
//   TextEditingController titleController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController latitudeController = TextEditingController();
//   TextEditingController longitudeController = TextEditingController();
//   LocationService locationService = LocationService();

//   Future<void> addApartment({
//     required String title,
//     required int price,
//     required int ownerID,
//     required String description,
//     required String location,
//     required double latitude,
//     required double longitude,
//   }) async {
//     emit(AddApartmentLoading());
//     FormData formData = FormData.fromMap({
//       "pricePerMonthdto": price,
//       "descriptiondto": description,
//       "titledto": title,
//       "imageFiles": null,
//       "imagePaths": null,
//       "locationdto": location,
//       "latitudedto": latitude,
//       "longitudedto": longitude,
//       "owner_id": ownerID,
//     });
//     var response = await propertyManageRepo.postApartment(formdata: formData);
//     response.fold(
//       (failure) {
//         emit(AddApartmentFailure(errmsg: failure.errmsg));
//       },
//       (msg) {
//         emit(AddApartmentSuccess(msg: msg));
//       },
//     );
//   }

//   getMyLocation() async {
//     emit(AddApartmentLoading());
//     LocationData myLocation = await locationService.getMyLocation();
//     double lat=myLocation.latitude! ;
//     double lng=myLocation.longitude! ;
//     latitudeController.text = lat.toString();
//     longitudeController.text = lng.toString();
//     await getGovernorateFromCoordinates(lat, lng);
//     emit(AddApartmentSuccess(msg: "location is Loaded successfully"));
//   }

//   Future<void> getGovernorateFromCoordinates(double lat, double lng) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks.first;
//         // print("المحافظة: ${place.administrativeArea}");
//         // print("المدينة: ${place.locality}");
//         // print("الدولة: ${place.country}");
//         locationController.text =place.locality.toString() ;
//       }
//     } catch (e) {
//       print("خطأ أثناء تحديد الموقع: $e");
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart'; // ✅ مكتبة الصور
import 'package:location/location.dart';
import 'package:sakan/core/utils/location_service.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo.dart';

part 'add_apartment_state.dart';

class AddApartmentCubit extends Cubit<AddApartmentState> {
  AddApartmentCubit(this.propertyManageRepo) : super(AddApartmentInitial());

  final PropertyManageRepo propertyManageRepo;
  final LocationService locationService = LocationService();

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  List<XFile>? images; // ✅ متغير لحفظ الصور المختارة

  final ImagePicker picker = ImagePicker();

  // ✅ اختيار صور من المعرض
  Future<void> pickImages() async {
    images = await picker.pickMultiImage();
    emit(AddPhotosSuccess(msg: "Images selected successfully"));
  }

  Future<void> addApartment({
    required String title,
    required int price,
    required int ownerID,
    required String description,
    required String location,
    required double latitude,
    required double longitude,
  }) async {
    emit(AddApartmentLoading());

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
    var response = await propertyManageRepo.postApartment(formdata: formData);
    response.fold(
      (failure) {
        emit(AddApartmentFailure(errmsg: failure.errmsg));
      },
      (msg) {
        emit(AddApartmentSuccess(msg: msg));
      },
    );
  }

  // ✅ تحديد موقعي الحالي
  getMyLocation() async {
    emit(AddApartmentLoading());
    LocationData myLocation = await locationService.getMyLocation();
    double lat = myLocation.latitude!;
    double lng = myLocation.longitude!;
    latitudeController.text = lat.toString();
    longitudeController.text = lng.toString();
    await getGovernorateFromCoordinates(lat, lng);
    emit(AddLocationSuccess(msg: "location is Loaded successfully"));
  }

  // ✅ تحويل الإحداثيات إلى اسم محافظة
  Future<void> getGovernorateFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationController.text = place.locality.toString();
      }
    } catch (e) {
      print("خطأ أثناء تحديد الموقع: $e");
    }
  }
}
