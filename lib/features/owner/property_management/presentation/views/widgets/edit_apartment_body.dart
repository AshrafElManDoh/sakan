import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_description_field.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/core/widgets/custom_text_field_inside.dart';
import 'package:sakan/core/widgets/custom_upload_photos.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/edit_apartment_cubit/edit_apartment_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EditApartmentBody extends StatelessWidget {
  const EditApartmentBody({super.key, required this.apartmentModel});
  final ApartmentModel apartmentModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditApartmentCubit, EditApartmentState>(
      listener: (context, state) {
        if (state is EditApartmentfetchApartment) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is EditApartmentFailure) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.error(message: state.errmsg));
        } else if (state is EditApartmentSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
          Future.delayed(Duration(milliseconds: 500), () {
            GoRouter.of(context).pop(true);
          });
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<EditApartmentCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: state is EditApartmentLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Apartment",
                    style: AppStyles.stylesSemiBold30
                        .copyWith(color: ksecondaryColor),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextFieldInside(
                    title: "Apartment Title",
                    textEditingController: cubit.apartmentTitleController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldInside(
                    title: "Price per month",
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Add location automatically",
                              style: AppStyles.stylesMedium18),
                          CustomProfileButton(
                            title: "Add Location",
                            color: ksecondaryColor,
                            onTap: () {
                              cubit.getMyLocation();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFieldInside(
                        title: "Location",
                        textEditingController: cubit.locationController,
                        makeActive: false,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFieldInside(
                              title: "Latitude",
                              textEditingController: cubit.latitudeController,
                              makeActive: false,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CustomTextFieldInside(
                              title: "Longitude",
                              textEditingController: cubit.longitudeController,
                              makeActive: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomUploadPhotos(
                    title: "Upload Apartment Photos",
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
                      title: "Edit",
                      color: ksecondaryColor,
                      onTap: () {
                        cubit.editApartment(
                            id: apartmentModel.id!,
                            title: cubit.apartmentTitleController.text,
                            price:
                                int.tryParse(cubit.priceController.text) ?? 0,
                            ownerID: apartmentModel.ownerId!,
                            description: cubit.descriptionController.text,
                            location: cubit.locationController.text,
                            latitude: double.tryParse(
                                    cubit.latitudeController.text) ??
                                0,
                            longitude: double.tryParse(
                                    cubit.longitudeController.text) ??
                                0);
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
