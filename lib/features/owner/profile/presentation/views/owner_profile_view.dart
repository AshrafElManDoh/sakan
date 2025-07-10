import 'package:flutter/material.dart';
import 'package:sakan/features/owner/profile/presentation/views/widgets/owner_profile_body.dart';

class OwnerProfileView extends StatelessWidget {
  const OwnerProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OwnerProfileBody(),
    );
  }
}
