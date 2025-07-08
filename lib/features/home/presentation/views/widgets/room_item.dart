import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({super.key, required this.room, required this.index});
  final RoomModel room;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
            "${AppRouter.homeView}/${AppRouter.apartmentDetailsView}/${AppRouter.roomDetailsView}",
            extra: room);
      },
      child: AspectRatio(
        aspectRatio: 145 / 157,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 180 / 125,
                child: Image.network(
                  room.imagePaths![0],
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Text("There is no photos !"),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Room ${index + 1}",
                style: AppStyles.stylesBold16,
              ),
              // SizedBox(
              //   height: 10,
              // ),
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
              Spacer(),
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
                    '${room.pricePerMonth} EGP/month',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
