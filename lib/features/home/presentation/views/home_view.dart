import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: HomeBody()
    );
  }
}
