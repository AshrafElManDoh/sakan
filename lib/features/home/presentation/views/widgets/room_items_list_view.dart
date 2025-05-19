import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/room_item.dart';

class RoomItemsListView extends StatelessWidget {
  const RoomItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RoomItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: 3,
      ),
    );
  }
}
