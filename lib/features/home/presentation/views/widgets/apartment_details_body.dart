import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_images_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/description_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/location_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/rooms_widget.dart';
import 'package:sakan/features/home/presentation/views_model/get_rooms_cubit/get_rooms_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ApartmentDetailsBody extends StatelessWidget {
  const ApartmentDetailsBody({super.key, required this.apartmentModel});
  final ApartmentModel apartmentModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (apartmentModel.imagePaths!.isNotEmpty ||
                        apartmentModel.imagePaths != null)
                    ? ApartmentImagesWidget(
                        listImages: apartmentModel.imagePaths!,
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 380 / 225,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text("There is no photos !"),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  apartmentModel.titledto!,
                  style: AppStyles.stylesBold20,
                ),
                SizedBox(
                  height: 16,
                ),
                DescriptionText(
                  description_text: apartmentModel.descriptiondto!,
                ),
                SizedBox(
                  height: 16,
                ),
                // PreviewFacilitesWidget(),
                // SizedBox(
                //   height: 16,
                // ),
                LocationWidget(
                  location: apartmentModel.locationdto!,
                  latitude: apartmentModel.latitudedto!,
                  longitude: apartmentModel.longitudedto!,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          sliver: SliverToBoxAdapter(
            child: BlocConsumer<GetRoomsCubit, GetRoomsState>(
              listener: (context, state) {
                if (state is GetRoomsSuccess) {
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.success(message: "Success"));
                } else if (state is GetRoomsFailure) {
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.error(message: "failure"));
                }
              },
              builder: (context, state) {
                if (state is GetRoomsSuccess) {
                  return RoomsWidget(
                    rooms: state.listOfRooms,
                  );
                } else if (state is GetRoomsFailure) {
                  return Text("There is an error : ${state.errmsg}");
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
      ],
    );
  }
}
