import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_prefs_helper.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/owner/booking_request/presentation/views/widgets/request_table.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/property_container_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingReqeuestsBody extends StatefulWidget {
  const BookingReqeuestsBody({super.key});

  @override
  State<BookingReqeuestsBody> createState() => _BookingReqeuestsBodyState();
}

class _BookingReqeuestsBodyState extends State<BookingReqeuestsBody> {
  late String name = "";
  @override
  void initState() {
    getName();
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Track, manage and forecast your properties",
                  style: AppStyles.stylesRegular16,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      PropertyContainerHeader(),
                      SizedBox(
                        height: 16,
                      ),
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
