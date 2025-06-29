import 'package:flutter/material.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/add_room_body.dart';

class AddRoomView extends StatelessWidget {
  const AddRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: AddRoomBody(),
    );
  }
}
