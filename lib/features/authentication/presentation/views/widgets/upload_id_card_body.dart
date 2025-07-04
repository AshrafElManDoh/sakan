import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/core/widgets/custom_text_field_inside.dart';
import 'package:sakan/features/authentication/presentation/views_model/upload_id_card_cubit/upload_id_card_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UploadIdCardBody extends StatelessWidget {
  const UploadIdCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadIdCardCubit, UploadIdCardState>(
      listener: (context, state) {
        if (state is UploadIdCardProcessImage) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: state.msg));
        } else if (state is UploadIdCardFailure) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.error(message: state.errmsg));
        } else if (state is UploadIdCardSuccess) {
          showTopSnackBar(
              Overlay.of(context), CustomSnackBar.success(message: "Success"));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UploadIdCardLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Please upload your id card",
                      style: AppStyles.stylesMedium18,
                    ),
                    CustomProfileButton(
                      title: "Add card",
                      color: ksecondaryColor,
                      onTap: () async {
                        await BlocProvider.of<UploadIdCardCubit>(context)
                            .uploadImage();
                        BlocProvider.of<UploadIdCardCubit>(context)
                            .uploadIdCard();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFieldInside(
                  makeActive: false,
                  textEditingController:
                      BlocProvider.of<UploadIdCardCubit>(context)
                          .firstNamecontroller,
                  title: "First Name",
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFieldInside(
                  makeActive: false,
                  textEditingController:
                      BlocProvider.of<UploadIdCardCubit>(context)
                          .lastNamecontroller,
                  title: "Last Name",
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFieldInside(
                  makeActive: false,
                  textEditingController:
                      BlocProvider.of<UploadIdCardCubit>(context)
                          .nationalIdcontroller,
                  title: "National ID",
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFieldInside(
                  makeActive: false,
                  textEditingController:
                      BlocProvider.of<UploadIdCardCubit>(context)
                          .addresscontroller,
                  title: "Address",
                ),
                SizedBox(
                  height: 32,
                ),
                CustomProfileButton(
                  title: "next",
                  color: ksecondaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
