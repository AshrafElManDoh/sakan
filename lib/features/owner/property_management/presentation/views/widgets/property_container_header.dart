import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/search_field.dart';
import 'package:sakan/features/owner/property_management/presentation/views_model/property_manage_cubit/property_manage_cubit.dart';

class PropertyContainerHeader extends StatelessWidget {
  const PropertyContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomProfileButton(
              title: "Add apartment",
              color: ksecondaryColor,
              onTap: () async {
                final result = await context.push<bool>(
                    '${AppRouter.propertyManagementView}/${AppRouter.addApartmentView}',
                    extra: context.read<PropertyManageCubit>().comingOwnerId);
                if (result == true) {
                  context.read<PropertyManageCubit>().getApartments();
                }
              },
            ),
            CustomProfileButton(
              title: "Add room",
              color: ksecondaryColor,
              onTap: () {
                context.push(
                    '${AppRouter.propertyManagementView}/${AppRouter.addRoomView}',
                    extra: context.read<PropertyManageCubit>().comingOwnerId);
              },
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SearchField(),
        ),
      ],
    );
  }
}
