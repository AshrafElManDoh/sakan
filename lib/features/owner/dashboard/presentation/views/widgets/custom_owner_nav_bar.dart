import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomOwnerNavBar extends StatelessWidget {
  const CustomOwnerNavBar({super.key, this.onTap, required this.currentIndex});
  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          elevation: 0,
          unselectedItemColor: Color(0xff7D7F88),
          selectedItemColor: Color(0xff255685),
          selectedLabelStyle: TextStyle(
            overflow: TextOverflow.visible,
          ),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.bed),
              label: "Management",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.print),
              label: "Requests",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
