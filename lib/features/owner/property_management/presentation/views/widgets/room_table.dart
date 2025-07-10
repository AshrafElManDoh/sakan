import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/property_manage_cubit/property_manage_cubit.dart';

class RoomTable extends StatelessWidget {
  const RoomTable({super.key, required this.rooms});
  final List<RoomModel> rooms;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PropertyManageCubit>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Name")),
          // DataColumn(label: Text("Status")),
          DataColumn(label: Text("Apartment ID")),
          DataColumn(label: Text("Price")),
          DataColumn(label: Text("Listing ID")),
          DataColumn(label: Text("Actions")),
        ],
        rows: List.generate(
          rooms.length,
          (index) => DataRow(
            cells: [
              DataCell(Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      rooms[index].imagePaths![0],
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "assets/icon/apartment.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Room ${index + 1}'),
                ],
              )),
              // DataCell(_buildStatusBadge(index)),
              DataCell(Text("${rooms[index].apartmentId}")),
              DataCell(Text("${rooms[index].pricePerMonth} EGP")),
              DataCell(Text("${rooms[index].id}")),
              DataCell(Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await context.push<bool>(
                          "${AppRouter.propertyManagementView}/${AppRouter.editRoomView}",
                          extra: {
                            "room": rooms[index],
                            "ownerId": cubit.comingOwnerId
                          });
                      if (result == true) {
                        context
                            .read<PropertyManageCubit>()
                            .fetchAllRoomsForOwner(cubit.comingOwnerId);
                      }
                    },
                    icon: Icon(Icons.edit, size: 20),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.delete, size: 20),
                    onPressed: () {
                      final cubit = context.read<PropertyManageCubit>();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Confirm Delete"),
                          content: Text(
                              "Are you sure you want to delete this room?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // إغلاق البوب أب بدون حذف
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // إغلاق البوب أب
                                cubit.deleteRoom(roomId: rooms[index].id!);
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(int index) {
    // dummy logic for demo
    if (index == 1 || index == 6) {
      return _statusChip("Offline", Colors.red);
    } else if (index == 3 || index == 8) {
      return _statusChip("Booked", Colors.orange);
    }
    return _statusChip("Online", Colors.green);
  }

  Widget _statusChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
