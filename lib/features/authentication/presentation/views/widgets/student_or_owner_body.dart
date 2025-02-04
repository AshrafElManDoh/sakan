import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_container_for_user.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';

class StudentOrOwnerBody extends StatelessWidget {
  const StudentOrOwnerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomLogoandName(),
          SizedBox(
            height: 75,
          ),
          CustomConatinerForUser(
            icon: FontAwesomeIcons.userGraduate,
            userName: "Student",
          ),
          SizedBox(
            height: 24,
          ),
          CustomConatinerForUser(
            icon: FontAwesomeIcons.userGroup,
            userName: "Owner",
          )
        ],
      ),
    );
  }
}
