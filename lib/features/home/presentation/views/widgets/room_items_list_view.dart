import 'package:flutter/material.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/room_item.dart';

class RoomItemsListView extends StatelessWidget {
  const RoomItemsListView({super.key, required this.rooms});
  final List<RoomModel> rooms ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RoomItem(room: rooms[index],),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: rooms.length,
      ),
    );
  }
}
