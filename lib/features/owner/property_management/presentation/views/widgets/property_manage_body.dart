import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/apartment_table.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/property_container_header.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/room_table.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/property_manage_cubit/property_manage_cubit.dart';

// class PropertyManageBody extends StatelessWidget {
//   const PropertyManageBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Welcome back, Pedro Sevila ",
//                   style: AppStyles.stylesSemiBold20,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Track, manage and forecast your properties",
//                   style: AppStyles.stylesRegular16,
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     children: [
//                       PropertyContainerHeader(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Apartments",
//                             style: AppStyles.stylesSemiBold13,
//                           ),
//                           Switch(
//                             activeTrackColor: ksecondaryColor,
//                             value: BlocProvider.of<PropertyManageCubit>(context)
//                                 .isRoom,
//                             onChanged: (value) {
//                               BlocProvider.of<PropertyManageCubit>(context)
//                                       .isRoom =
//                                   !BlocProvider.of<PropertyManageCubit>(context)
//                                       .isRoom;
//                             },
//                           ),
//                           Text(
//                             "Rooms",
//                             style: AppStyles.stylesSemiBold13,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                       BlocBuilder<PropertyManageCubit, PropertyManageState>(
//                         builder: (context, state) {
//                           if (state is PropertyManageSuccessApartments) {
//                             return ApartmentTable(
//                               apartments: state.apartmentList,
//                             );
//                           } else if (state is PropertyManageSuccessRooms) {
//                             return RoomTable(rooms: state.roomList);
//                           } else {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sakan/constants.dart';
// import 'package:sakan/core/utils/app_styles.dart';
// import 'package:sakan/features/owner/property_management/presentation/views/widgets/apartment_table.dart';
// import 'package:sakan/features/owner/property_management/presentation/views/widgets/property_container_header.dart';
// import 'package:sakan/features/owner/property_management/presentation/views/widgets/room_table.dart';
// import 'package:sakan/features/owner/property_management/presentation/views_model/property_manage_cubit/property_manage_cubit.dart';

class PropertyManageBody extends StatefulWidget {
  const PropertyManageBody({super.key});

  @override
  State<PropertyManageBody> createState() => _PropertyManageBodyState();
}

class _PropertyManageBodyState extends State<PropertyManageBody> {
  late int ownerId;

  @override
  void initState() {
    ownerId = BlocProvider.of<PropertyManageCubit>(context).comingOwnerId = 3;
    BlocProvider.of<PropertyManageCubit>(context).getApartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back, Pedro Sevila ",
                  style: AppStyles.stylesSemiBold20,
                ),
                const SizedBox(height: 10),
                Text(
                  "Track, manage and forecast your properties",
                  style: AppStyles.stylesRegular16,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const PropertyContainerHeader(),

                      /// 🔄 سويتش التحويل بين Apartments و Rooms
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Apartments", style: AppStyles.stylesSemiBold13),
                          BlocBuilder<PropertyManageCubit, PropertyManageState>(
                            builder: (context, state) {
                              return Switch(
                                activeTrackColor: ksecondaryColor,
                                value:
                                    context.watch<PropertyManageCubit>().isRoom,
                                onChanged: (value) {
                                  context
                                      .read<PropertyManageCubit>()
                                      .toggleRoomOrApartment(
                                          ownerId: BlocProvider.of<
                                                  PropertyManageCubit>(context)
                                              .comingOwnerId);
                                },
                              );
                            },
                          ),
                          Text("Rooms", style: AppStyles.stylesSemiBold13),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// 🧱 جدول العرض
                      BlocBuilder<PropertyManageCubit, PropertyManageState>(
                        builder: (context, state) {
                          if (state is PropertyManageSuccessApartments) {
                            return ApartmentTable(
                                apartments: state.apartmentList);
                          } else if (state is PropertyManageSuccessRooms) {
                            return RoomTable(rooms: state.roomList);
                          } else if (state is PropertyManageFailure) {
                            return Text("Error: ${state.errmsg}");
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
