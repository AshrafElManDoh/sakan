import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/student_or_owner_body.dart';

class StudentOrOwnerView extends StatelessWidget {
  const StudentOrOwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
          child: StudentOrOwnerBody()),
    );
  }
}
