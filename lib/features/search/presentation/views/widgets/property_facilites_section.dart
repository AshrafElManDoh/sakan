import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

// class PropertyFacilitesSection extends StatelessWidget {
//   const PropertyFacilitesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Property facilites",style: AppStyles.stylesSemiBold20,),
//         SizedBox(height: 16,),

//       ],
//     );
//   }
// }

class PropertyFacilitesSection extends StatefulWidget {
  const PropertyFacilitesSection({super.key});

  @override
  State<PropertyFacilitesSection> createState() =>
      _PropertyFacilitesSectionState();
}

class _PropertyFacilitesSectionState extends State<PropertyFacilitesSection> {
  final List<String> facilities = [
    'Any',
    'WiFi',
    'Self check-in',
    'Kitchen',
    'Free parking',
    'Air conditioner',
    'Security',
  ];

  // Set to keep track of selected ones
  final Set<String> selectedFacilities = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Property facilites",
          style: AppStyles.stylesSemiBold20,
        ),
        SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: facilities.map(
            (facility) {
              final isSelected = selectedFacilities.contains(facility);

              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (isSelected) {
                        selectedFacilities.remove(facility);
                      } else {
                        selectedFacilities.add(facility);
                      }
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF195A91) : null,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF195A91) : kthirdColor,
                    ),
                  ),
                  child: Text(
                    facility,
                    style: TextStyle(
                      color: isSelected ? Colors.white : kthirdColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
