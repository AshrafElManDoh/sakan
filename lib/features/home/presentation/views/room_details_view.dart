import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/home/data/models/ai_response_model/ai_response_model.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_images_widget.dart';
import 'package:sakan/features/home/presentation/views_model/get_ai_information_cubit/get_ai_information_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RoomDetailsView extends StatefulWidget {
  const RoomDetailsView({super.key, required this.roomModel});
  final RoomModel roomModel;

  @override
  State<RoomDetailsView> createState() => _RoomDetailsViewState();
}

class _RoomDetailsViewState extends State<RoomDetailsView> {
  AiResponseModel? aiResponse;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAiInformationCubit>(context)
        .getResponse(roomLink: widget.roomModel.imagePaths![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      body: BlocConsumer<GetAiInformationCubit, GetAiInformationState>(
        listener: (context, state) {
          if (state is GetAiInformationSuccess) {
            aiResponse = state.aiResponseModel;
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                  message: "Loaded Ai information successfully"),
            );
          } else if (state is GetAiInformationFailure) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errmsg),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is GetAiInformationLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ApartmentImagesWidget(
                      listImages: widget.roomModel.imagePaths!,
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.roomModel.title!,
                      style: AppStyles.stylesSemiBold20,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Price Details",
                      style: AppStyles.stylesSemiBold16
                          .copyWith(color: Color(0xff344054)),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly",
                            style: AppStyles.stylesSemiBold16
                                .copyWith(color: Color(0xff344054))),
                        Text(
                          "${widget.roomModel.pricePerMonth} EGP",
                          style: AppStyles.stylesSemiBold13,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AI-Generated Output:",
                          style: AppStyles.stylesBold20,
                        ),
                        Text(
                          " This content was automatically generated by an AI system and may include approximations or inaccuracies.",
                          style: AppStyles.stylesRegular16
                              .copyWith(color: Colors.grey),
                              overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    if (aiResponse != null) ...[
                      _buildInfoItem(
                          "Estimated Area", aiResponse!.estimatedAreaSqm),
                      _buildInfoItem("Main Items", aiResponse!.mainItems),
                      _buildInfoItem("Floor Type", aiResponse!.floorType),
                      _buildInfoItem("Window View", aiResponse!.windowView),
                      _buildInfoItem("Natural Light", aiResponse!.naturalLight),
                      _buildInfoItem("Room Type", aiResponse!.roomType),
                      _buildInfoItem("Ventilation", aiResponse!.ventilation),
                      _buildInfoItem(
                          "Wall Condition", aiResponse!.wallCondition),
                      _buildInfoItem("Rental Tips", aiResponse!.rentalTips),
                    ],CustomButton(
                      name: "Book this room",
                      onTap: () async {
                        await Future.delayed(Duration(milliseconds: 2000));
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                              message: "The room is booked successfully"),
                        );
                        GoRouter.of(context).go(AppRouter.homeView);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoItem(String title, String? content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppStyles.stylesSemiBold16
                  .copyWith(color: Color(0xff344054))),
          const SizedBox(height: 4),
          Text(content ?? 'Not available', style: AppStyles.stylesRegular16),
        ],
      ),
    );
  }
}
