import 'package:flutter/material.dart';
import 'package:sakan/features/owner/booking_request/data/models/request_model.dart';

class RequestTable extends StatelessWidget {
  const RequestTable({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<BookingRequestModel> list = [
    //   BookingRequestModel(
    //     roomName: 'Room 1',
    //     apartmentName: 'adab street',
    //     price: '1000 EGP',
    //     residentName: 'Ashraf Mohamed',
    //     residentImage: 'assets/icon/person.jpg',
    //     roomImage: 'assets/icon/apartment.png',
    //     date: DateTime(2025, 7, 10),
    //     status: 'Accepted',
    //   ),
    //   BookingRequestModel(
    //     roomName: 'Room 2',
    //     apartmentName: 'شقة بالمنصورة',
    //     price: '1200 EGP',
    //     residentName: 'Eslam',
    //     residentImage: 'assets/icon/person.jpg',
    //     roomImage: 'assets/icon/apartment.png',
    //     date: DateTime(2025, 7, 10),
    //     status: 'Pending',
    //   ),
    // ];
    final List<BookingRequestModel> list =[];
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
          // DataColumn(
          //   label: Text("Status"),
          // ),
          DataColumn(
            label: Text("More"),
          ),
        ],
        rows: List.generate(list.length, (index) {
          return DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        list[index].roomImage,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(list[index].roomName),
                  ],
                ),
              ),
              DataCell(
                Text(list[index].apartmentName),
              ),
              DataCell(Text(list[index].price)),
              DataCell(
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/icon/person.jpg"),
                    ),
                    const SizedBox(width: 8),
                    Text(list[index].residentName)
                  ],
                ),
              ),
              DataCell(
                Text(
                    "${list[index].date.year}-${list[index].date.month}-${list[index].date.day}"),
              ),
              // DataCell(
              //   Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: Colors.green.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Text(
              //       "Accepted",
              //       style: TextStyle(
              //           color: Colors.green, fontWeight: FontWeight.w600),
              //     ),
              //   ),
              // ),
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
