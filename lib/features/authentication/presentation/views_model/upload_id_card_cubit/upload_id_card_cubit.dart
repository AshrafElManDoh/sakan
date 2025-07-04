import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/authentication/data/models/id_card_model/id_card_model.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo.dart';

part 'upload_id_card_state.dart';

class UploadIdCardCubit extends Cubit<UploadIdCardState> {
  UploadIdCardCubit(this.authRepo) : super(UploadIdCardInitial());
  final AuthRepo authRepo;
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController nationalIdcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future<void> uploadImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      emit(UploadIdCardProcessImage(msg: "Please waiting !"));
    }else{
      emit(UploadIdCardFailure(errmsg: "Please choose your id !"));
    }
    
  }

  Future<void> uploadIdCard() async {
    emit(UploadIdCardLoading());
    MultipartFile imageFile;
    if (image != null) {
      imageFile =
          await MultipartFile.fromFile(image!.path, filename: image!.name);
      FormData formData = FormData.fromMap({"image": imageFile});
      var response = await authRepo.uploadId(formdata: formData);
      response.fold(
        (failure) {
          emit(UploadIdCardFailure(errmsg: failure.errmsg));
        },
        (idCardModel) {
          firstNamecontroller.text = idCardModel.firstName!;
          lastNamecontroller.text = idCardModel.lastName!;
          nationalIdcontroller.text = idCardModel.nationalId!;
          addresscontroller.text = idCardModel.address!;
          emit(UploadIdCardSuccess(id: idCardModel));
        },
      );
    } else {
      emit(UploadIdCardFailure(errmsg: "Please choose your id !"));
    }
  }
}
