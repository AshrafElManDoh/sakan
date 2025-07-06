import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomDescriptionField extends StatelessWidget {
  const CustomDescriptionField({
    super.key,
    required this.title,
    this.textEditingController,
    this.makeActive,
    this.isNumberOnly,
  });
  final TextEditingController? textEditingController;
  final String title;
  final bool? makeActive;
  final bool? isNumberOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(title, style: AppStyles.stylesMedium18),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          maxLines: 6,
          keyboardType: isNumberOnly == true ? TextInputType.number : null,
          enabled: makeActive,
          controller: textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kcolorOfTextField),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kcolorOfTextField),
            ),
          ),
        ),
      ],
    );
  }
}
// class CustomDescriptionField extends StatelessWidget {
//   const CustomDescriptionField({
//     super.key,
//     required this.title,
//   });
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: AppStyles.stylesMedium18),
//         SizedBox(
//           height: 6,
//         ),
//         TextFormField(
//           maxLines: 6,
//           decoration: InputDecoration(
//             hintText: "Enter a description...",
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: kcolorOfTextField),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: kcolorOfTextField),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
