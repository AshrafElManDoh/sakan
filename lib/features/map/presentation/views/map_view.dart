import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true,),
      body: Center(child: Text("Map View"),),
    );
  }
}