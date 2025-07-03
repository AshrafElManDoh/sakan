// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sakan/constants.dart';
// import 'package:sakan/core/utils/app_styles.dart';
// import 'package:sakan/core/widgets/custom_profile_button.dart';
// import 'package:sakan/features/owner/property_management/data/models/add_apartment_cubit/add_apartment_cubit.dart';

// class CustomUploadPhotos extends StatelessWidget {
//   const CustomUploadPhotos({super.key, required this.title});
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: AppStyles.stylesMedium18,
//             ),
//             CustomProfileButton(title: "Add Photos", color: ksecondaryColor,onTap: () {
//               BlocProvider.of<AddApartmentCubit>(context).pickImages();
//             },)
//           ],
//         ),
//         SizedBox(
//           height: 6,
//         ),
//         Container(
//           height: 300,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Center(
//               child: BlocProvider.of<AddApartmentCubit>(context).images ==null ? Center(child: Text("There is no photos !")) : ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/features/owner/property_management/data/models/add_apartment_cubit/add_apartment_cubit.dart';

class CustomUploadPhotos extends StatelessWidget {
  const CustomUploadPhotos({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.stylesMedium18,
            ),
            CustomProfileButton(
              title: "Add Photos",
              color: ksecondaryColor,
              onTap: () {
                BlocProvider.of<AddApartmentCubit>(context).pickImages();
              },
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<AddApartmentCubit, AddApartmentState>(
              builder: (context, state) {
                final images =
                    BlocProvider.of<AddApartmentCubit>(context).images;
                if (images == null || images.isEmpty) {
                  return const Center(child: Text("There is no photos!"));
                } else {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(images[index].path),
                          // width: 150,
                          // height: 150,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
