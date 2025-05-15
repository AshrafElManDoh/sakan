import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/choose_city_view.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ChooseCityView()
    );
  }
}
