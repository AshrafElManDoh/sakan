import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';

class RoomTable extends StatelessWidget {
  const RoomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Apartment")),
          DataColumn(label: Text("Price")),
          DataColumn(label: Text("Listing ID")),
          DataColumn(label: Text("Actions")),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/icon/apartment.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Room ${index + 1}'),
                ],
              )),
              DataCell(_buildStatusBadge(index)),
              const DataCell(Text("Casa da Alegria")),
              const DataCell(Text("300€")),
              DataCell(Text("15${90 - index}")),
              DataCell(Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.push(
                          "${AppRouter.propertyManagementView}/${AppRouter.editRoomView}");
                    },
                    icon: Icon(Icons.edit, size: 20),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.delete, size: 20),
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
