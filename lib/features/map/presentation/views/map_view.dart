import 'package:flutter/material.dart';
import 'package:sakan/features/map/presentation/views/widgets/map_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(forceMaterialTransparency: true,),
      body: MapBody(),
      // body: Center(child: Text("Map"),),
    );
  }
}