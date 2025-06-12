import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/search_field.dart';

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
              onTap: () {
                context.push(
                    '${AppRouter.propertyManagementView}/${AppRouter.addApartmentView}');
              },
            ),
            CustomProfileButton(
              title: "Add room",
              color: ksecondaryColor,
              onTap: () {
                context.push(
                    '${AppRouter.propertyManagementView}/${AppRouter.addRoomView}');
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
