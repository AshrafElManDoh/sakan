import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_images_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/description_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/location_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/preview_facilites_widget.dart';
import 'package:sakan/features/home/presentation/views/widgets/rooms_widget.dart';

class ApartmentDetailsView extends StatelessWidget {
  const ApartmentDetailsView({super.key});

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
                  ApartmentImagesWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "302 North plam Drive ",
                    style: AppStyles.stylesBold20,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DescriptionText(
                    description_text:
                        "Lorem ipsum dolor sit amet consectetur. Sit dui fermentum vitae in dui gravida lectus molestie. Dui a netus interdum enim. Vitae id ornare amet curabitur cursus arcu ante sed. Orci ipsum libero sed in eget vitae. Nulla fringilla integer viverra aenean massa. Metus consequat purus enim tortor malesuada morbi. Eget mattis risus mauris egestas. Aenean quis amet habitant tortor facilisis viverra erat viverra velit. Velit mattis magna cursus purus vitae mauris senectus maed,",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  PreviewFacilitesWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  LocationWidget(),
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
