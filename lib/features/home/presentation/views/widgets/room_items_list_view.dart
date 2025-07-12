// import 'package:flutter/material.dart';
// import 'package:sakan/features/home/data/models/room_model/room_model.dart';
// import 'package:sakan/features/home/presentation/views/widgets/room_item.dart';

// class RoomItemsListView extends StatelessWidget {
//   const RoomItemsListView({super.key, required this.rooms});
//   final List<RoomModel> rooms;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) => rooms[index].isAvailable! ? RoomItem(
//           room: rooms[index],
//           index: index,
//         ),
//         separatorBuilder: (context, index) => SizedBox(
//           width: 10,
//         ),
//         itemCount: rooms.length,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/home/presentation/views/widgets/room_item.dart';

class RoomItemsListView extends StatelessWidget {
  const RoomItemsListView({super.key, required this.rooms});
  final List<RoomModel> rooms;

  @override
  Widget build(BuildContext context) {
    final availableRooms =
        rooms.where((room) => room.isAvailable == true).toList();
    return SizedBox(
      height: 300,
      child: availableRooms.isEmpty
          ? Center(child: Text("No available rooms"))
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RoomItem(
                room: availableRooms[index],
                index: index,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: availableRooms.length,
            ),
    );
  }
}
