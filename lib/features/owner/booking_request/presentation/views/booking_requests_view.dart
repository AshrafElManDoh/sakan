import 'package:flutter/material.dart';
import 'package:sakan/features/owner/booking_request/presentation/views/widgets/booking_reqeuests_body.dart';

class BookingRequestsView extends StatelessWidget {
  const BookingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BookingReqeuestsBody(),
    );
  }
}