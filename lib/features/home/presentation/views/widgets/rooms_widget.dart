import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/room_items_list_view.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rooms",style: AppStyles.stylesSemiBold13,),
        SizedBox(height: 16,),
        RoomItemsListView(),
        SizedBox(height: 32,),
      ],
    );
  }
}

