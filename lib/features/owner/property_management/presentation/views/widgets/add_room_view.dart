import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/utils/service_locator.dart';
import 'package:sakan/features/owner/property_management/data/repos/property_manage_repo_imp.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/add_room_body.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/add_room_cubit/add_room_cubit.dart';

class AddRoomView extends StatelessWidget {
  const AddRoomView({super.key, required this.ownerId});
  final int ownerId ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (context) => AddRoomCubit(getIt.get<PropertyManageRepoImp>())..getApartments(comingOwnerId: ownerId),
        child: AddRoomBody(),
      ),
    );
  }
}
