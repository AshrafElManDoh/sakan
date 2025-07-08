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
import 'package:sakan/features/owner/property_management/presentation/views/widgets/drop_down_apartments.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/add_room_cubit/add_room_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddRoomBody extends StatelessWidget {
  const AddRoomBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddRoomCubit>(context);
    return BlocConsumer<AddRoomCubit, AddRoomState>(
      listener: (context, state) {
        if (state is AddRoomPhotosSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is AddRoomFailure) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.error(message: state.errmsg));
        } else if (state is AddRoomSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
          Future.delayed(
            Duration(milliseconds: 500),
            () {
              GoRouter.of(context).pop();
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddRoomLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Room",
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
                      cubit.selectedValueFromDropdownList = newValue;
                    },
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
                      title: "Add Room",
                      color: ksecondaryColor,
                      onTap: () {
                        cubit.addRoom(
                            title: cubit.titleController.text,
                            price:
                                int.tryParse(cubit.priceController.text) ?? 0,
                            apartmentId: cubit.selectedValueFromDropdownList!,
                            description: cubit.descriptionController.text,
                            isAvailable: true);
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
