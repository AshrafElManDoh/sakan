import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartment_images_widget.dart';

class RoomDetailsView extends StatelessWidget {
  const RoomDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ApartmentImagesWidget(
              listImages: [
                "http://sakan.runasp.net/Images/921defda-3d23-4f70-9831-9edddaad6b39.jpg"
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Room 1",
              style: AppStyles.stylesSemiBold20,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Price Details",
              style:
                  AppStyles.stylesSemiBold16.copyWith(color: Color(0xff344054)),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Monthly", style: AppStyles.stylesSemiBold13),
                Text(
                  r"$300",
                  style: AppStyles.stylesSemiBold13,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
