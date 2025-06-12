import 'package:flutter/material.dart';

class RequestTable extends StatelessWidget {
  const RequestTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text("Room"),
          ),
          DataColumn(
            label: Text("Apartment"),
          ),
          DataColumn(
            label: Text("Price"),
          ),
          DataColumn(
            label: Text("Tenants"),
          ),
          DataColumn(
            label: Text("Date Application"),
          ),
          DataColumn(
            label: Text("Status"),
          ),
          DataColumn(
            label: Text("More"),
          ),
        ],
        rows: List.generate(10, (index) {
          return DataRow(
            cells: [
              DataCell(
                Row(
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
                ),
              ),
              DataCell(
                Text("Casa da Alegria"),
              ),
              const DataCell(Text("300€")),
              DataCell(
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/icon/Oval.png"),
                    ),
                    const SizedBox(width: 8),
                    Text("Olivia Rhye")
                  ],
                ),
              ),
              DataCell(
                Text("01-01-2024"),
              ),
              DataCell(
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Accepted",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              DataCell(IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ))
            ],
          );
        }),
      ),
    );
  }
}
