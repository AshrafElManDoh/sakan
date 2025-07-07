import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/home/data/models/room_model/room_model.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo_imp.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/edit_room_body.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/edit_room_cubit/edit_room_cubit.dart';

class EditRoomView extends StatelessWidget {
  const EditRoomView(
      {super.key, required this.roomModel, required this.ownerid});
  final RoomModel roomModel;
  final int ownerid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => EditRoomCubit(getIt.get<PropertyManageRepoImp>())
          ..fetchRoom(room_model: roomModel, comingOwnerId: ownerid),
        child: EditRoomBody(
          roomModel: roomModel,
        ),
      ),
    );
  }
}
