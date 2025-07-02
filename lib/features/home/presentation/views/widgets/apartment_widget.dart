import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/location_text.dart';

class ApartmentWidget extends StatelessWidget {
  const ApartmentWidget({super.key, required this.apartmentModel});
  final ApartmentModel apartmentModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${AppRouter.homeView}/${AppRouter.apartmentDetailsView}');
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 180 / 125,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    apartmentModel.imagePaths![0],
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Text("There is no photos !"),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xff255685),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '2.1 km',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),

            //title & subtitle

            Text(
              apartmentModel.titledto!,
              style: AppStyles.stylesBold16,
            ),
            LocationText(
              locationAddress: apartmentModel.locationdto!,
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Divider(),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       _iconText(Icons.square_foot, '240 Square Feet'),
            //       _iconText(Icons.chair, 'Furnished'),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10),

            // // Features Row 2
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       _iconText(Icons.bed, '4 Bedrooms'),
            //       _iconText(Icons.bathtub, '2 Bathrooms'),
            //     ],
            //   ),
            // ),

            // SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Divider(),
            // ),

            // // Owner + Time
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       _iconText(Icons.person, 'Adam Smith'),
            //       _iconText(Icons.access_time, '5 days ago'),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff255685),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  '${apartmentModel.pricePerMonthdto} EGP/month',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Color(0xff255685),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff255685),
          ),
        ),
      ],
    );
  }
}
