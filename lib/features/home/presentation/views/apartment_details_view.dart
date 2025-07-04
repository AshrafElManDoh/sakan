import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_images_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/description_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/location_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/rooms_widget.dart';

class ApartmentDetailsView extends StatelessWidget {
  const ApartmentDetailsView({super.key, required this.apartmentModel});
  final ApartmentModel apartmentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: CustomScrollView(
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
              child: RoomsWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
