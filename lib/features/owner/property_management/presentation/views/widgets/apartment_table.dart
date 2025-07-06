import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';

class ApartmentTable extends StatelessWidget {
  const ApartmentTable({super.key, required this.apartments});
  final List<ApartmentModel> apartments ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Price")),
          DataColumn(label: Text("Listing ID")),
          DataColumn(label: Text("Actions")),
        ],
        rows: List.generate(
          apartments.length,
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
                  Text('Apartment ${index + 1}'),
                ],
              )),
              DataCell(_buildStatusBadge(index)),
              DataCell(Text("${apartments[index].pricePerMonthdto} EGP")),
              DataCell(Text("${apartments[index].id}")),
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
