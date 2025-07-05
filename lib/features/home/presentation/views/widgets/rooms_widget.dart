import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/room_items_list_view.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({super.key, required this.rooms});
  final List<RoomModel> rooms;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rooms",
          style: AppStyles.stylesSemiBold13,
        ),
        SizedBox(
          height: 16,
        ),
        RoomItemsListView(
          rooms: rooms,
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
