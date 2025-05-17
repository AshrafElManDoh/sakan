import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/search/presentation/views/widgets/text_container_no_background_color.dart';

class PriceSection extends StatefulWidget {
  const PriceSection({super.key});

  @override
  State<PriceSection> createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price",
          style: AppStyles.stylesSemiBold20,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            TextContainerNoBackgroundColor(
              isActive: currentIndex == 0,
              title: "High to Low",
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            SizedBox(
              width: 10,
            ),
            TextContainerNoBackgroundColor(
              isActive: currentIndex == 1,
              title: "Low to High",
              onTap: () {
                setState(
                  () {
                    currentIndex = 1;
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
