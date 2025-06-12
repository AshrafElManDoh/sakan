import 'package:flutter/material.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_room_body.dart';

class EditRoomView extends StatelessWidget {
  const EditRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true,),
      body: EditRoomBody(),
    );
  }
}