import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_description_field.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/core/widgets/custom_text_field_inside.dart';
import 'package:sakan/core/widgets/custom_upload_photos.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/drop_down_apartments.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/edit_room_cubit/edit_room_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EditRoomBody extends StatelessWidget {
  const EditRoomBody({super.key, required this.roomModel});
  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<EditRoomCubit>(context);
    cubit.selectedValueFromDropdownList = roomModel.apartmentId!;
    cubit.isAvailable = roomModel.isAvailable!;
    return BlocConsumer<EditRoomCubit, EditRoomState>(
      listener: (context, state) {
        if (state is EditRoomFetchRoom) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is EditRoomFailure) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.error(message: state.errmsg));
        } else if (state is EditRoomPhotoSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is EditRoomSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
          Future.delayed(Duration(milliseconds: 500), () {
            GoRouter.of(context).pop(true);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditRoomLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Room",
                    style: AppStyles.stylesSemiBold30
                        .copyWith(color: ksecondaryColor),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextFieldInside(
                    title: "Title",
                    textEditingController: cubit.titleController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldInside(
                    title: "Price",
                    textEditingController: cubit.priceController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomDescriptionField(
                    title: "Description",
                    textEditingController: cubit.descriptionController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DropDownApartments(
                    apartments: cubit.apartmentList,
                    value: cubit.selectedValueFromDropdownList,
                    onChanged: (newValue) {
                      cubit.selectedValueFromDropdownList = newValue!;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Room is available?",
                        style: AppStyles.stylesMedium18,
                      ),
                      Switch(
                        value: cubit.isAvailable,
                        activeTrackColor: ksecondaryColor,
                        onChanged: (value) {
                          cubit.switchIsAvailable();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomUploadPhotos(
                    title: "Upload Room Photos",
                    images: cubit.images,
                    onTap: () {
                      cubit.pickImages();
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    child: CustomProfileButton(
                      title: "Edit Room",
                      color: ksecondaryColor,
                      onTap: () {
                        cubit.editRoom(
                            title: cubit.titleController.text,
                            description: cubit.descriptionController.text,
                            price:
                                int.tryParse(cubit.priceController.text) ?? 0,
                            isAvailable: cubit.isAvailable,
                            apartmentId: roomModel.apartmentId!,
                            roomId: roomModel.id!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
