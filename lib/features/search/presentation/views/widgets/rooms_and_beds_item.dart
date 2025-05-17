import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/search/presentation/views/widgets/counter_widget.dart';

class RoomsAndBedsItem extends StatelessWidget {
  const RoomsAndBedsItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.stylesRegular16,
        ),
        CounterWidget()
      ],
    );
  }
}
