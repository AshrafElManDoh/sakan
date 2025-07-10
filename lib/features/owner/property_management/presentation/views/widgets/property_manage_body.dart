import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_prefs_helper.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/apartment_table.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/property_container_header.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/room_table.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/property_manage_cubit/property_manage_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PropertyManageBody extends StatefulWidget {
  const PropertyManageBody({super.key});

  @override
  State<PropertyManageBody> createState() => _PropertyManageBodyState();
}

class _PropertyManageBodyState extends State<PropertyManageBody> {
  late int ownerId;
  late String name="";
  @override
  void initState() {
    ownerId = BlocProvider.of<PropertyManageCubit>(context).comingOwnerId = 2;
    getName();
    BlocProvider.of<PropertyManageCubit>(context).getApartments();
    super.initState();
  }

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    name = await prefs.getString(AppPrefsHelper.keyfullName) ?? "";
    setState(() {});
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
                  "Welcome , $name ",
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
                      BlocConsumer<PropertyManageCubit, PropertyManageState>(
                        listener: (context, state) {
                          if (state is PropertyManagedeleteApartment) {
                            showTopSnackBar(Overlay.of(context),
                                CustomSnackBar.success(message: state.msg));
                          } else if (state is PropertyManageFailure) {
                            showTopSnackBar(Overlay.of(context),
                                CustomSnackBar.error(message: state.errmsg));
                          }
                        },
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
