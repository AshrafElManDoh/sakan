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
import 'package:sakan/features/owner/property_management/presentation/views_model/add_apartment_cubit/add_apartment_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddApartmentBody extends StatelessWidget {
  const AddApartmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddApartmentCubit, AddApartmentState>(
      listener: (context, state) {
        if (state is AddApartmentSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
          Future.delayed(Duration(milliseconds: 500), () {
            GoRouter.of(context).pop();
          });
        } else if (state is AddLocationSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is AddPhotosSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is AddApartmentFailure) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.error(message: state.errmsg));
        } else if (state is AddApartmentLoading) {}
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<AddApartmentCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: state is AddApartmentLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Apartment",
                    style: AppStyles.stylesSemiBold30
                        .copyWith(color: ksecondaryColor),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextFieldInside(
                    title: "Apartment Title",
                    textEditingController:
                        BlocProvider.of<AddApartmentCubit>(context)
                            .titleController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldInside(
                    isNumberOnly: true,
                    title: "Price per month",
                    textEditingController:
                        BlocProvider.of<AddApartmentCubit>(context)
                            .priceController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomDescriptionField(
                    title: "Description",
                    textEditingController:
                        BlocProvider.of<AddApartmentCubit>(context)
                            .descriptionController,
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
                              BlocProvider.of<AddApartmentCubit>(context)
                                  .getMyLocation();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFieldInside(
                        title: "Location",
                        textEditingController:
                            BlocProvider.of<AddApartmentCubit>(context)
                                .locationController,
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
                              textEditingController:
                                  BlocProvider.of<AddApartmentCubit>(context)
                                      .latitudeController,
                              makeActive: false,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CustomTextFieldInside(
                              title: "Longitude",
                              textEditingController:
                                  BlocProvider.of<AddApartmentCubit>(context)
                                      .longitudeController,
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
                  CustomUploadPhotos(title: "Upload Apartment Photos",images: cubit.images,onTap: cubit.pickImages,),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    child: CustomProfileButton(
                      title: "Add Apartment",
                      color: ksecondaryColor,
                      onTap: () async {
                        await BlocProvider.of<AddApartmentCubit>(context)
                            .addApartment(
                          title: BlocProvider.of<AddApartmentCubit>(context)
                              .titleController
                              .text,
                          price: int.parse(
                              BlocProvider.of<AddApartmentCubit>(context)
                                  .priceController
                                  .text),
                          ownerID: 2,
                          description:
                              BlocProvider.of<AddApartmentCubit>(context)
                                  .descriptionController
                                  .text,
                          location: BlocProvider.of<AddApartmentCubit>(context)
                              .locationController
                              .text,
                          latitude: double.parse(
                              BlocProvider.of<AddApartmentCubit>(context)
                                  .latitudeController
                                  .text),
                          longitude: double.parse(
                            BlocProvider.of<AddApartmentCubit>(context)
                                .longitudeController
                                .text,
                          ),
                        );
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
