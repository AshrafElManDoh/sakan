import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/custom_image_with_aspect_ratio.dart';

class ApartmentImagesWidget extends StatefulWidget {
  const ApartmentImagesWidget({super.key});

  @override
  State<ApartmentImagesWidget> createState() => _ApartmentImagesWidgetState();
}

class _ApartmentImagesWidgetState extends State<ApartmentImagesWidget> {
  List<String> images = [
    "assets/icon/apartment.png",
    "assets/icon/apartment2.png",
    "assets/icon/apartment3.png",
    "assets/icon/apartment2.png",
    "assets/icon/apartment3.png",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
              width: double.infinity,
              child: CustomImageWithAspectRatio(
                imagePath: images[currentIndex],
                isActive: false,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: images.asMap().entries.map(
                (e) {
                  int index = e.key;
                  String item = e.value;
                  return SizedBox(
                    height: 70,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
                      },
                      child: CustomImageWithAspectRatio(
                        isActive: currentIndex == index,
                        imagePath: item,
                      ),
                    ),
                  );
                },
              ).toList(),
            )
      ],
    );
  }
}