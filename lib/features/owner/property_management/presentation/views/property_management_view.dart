import 'package:flutter/material.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/property_manage_body.dart';

class PropertyManagementView extends StatelessWidget {
  const PropertyManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true,),
      body: PropertyManageBody(),
    );
  }
}