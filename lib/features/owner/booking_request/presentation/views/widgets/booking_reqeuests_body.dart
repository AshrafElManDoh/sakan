import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/owner/booking_request/presentation/views/widgets/request_table.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/property_container_header.dart';

class BookingReqeuestsBody extends StatelessWidget {
  const BookingReqeuestsBody({super.key});

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
                Text("Welcome back, Pedro Sevila ",style: AppStyles.stylesSemiBold20,),
                SizedBox(height: 10,),
                Text("Track, manage and forecast your properties",style: AppStyles.stylesRegular16,),
                SizedBox(height: 24,),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),child: Column(
                    children: [
                      PropertyContainerHeader(),
                      SizedBox(height: 16,),
                      RequestTable()
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