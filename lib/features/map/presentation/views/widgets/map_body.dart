import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  late GoogleMapController googleMapController;
  late CameraPosition initCameraPosition;

  @override
  void initState() {
    initCameraPosition = CameraPosition(target: LatLng(31, 41), zoom: 13);
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        initialCameraPosition: initCameraPosition,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
      ),
      Positioned(
        bottom: 20,
        right: 14,
        left: 14,
        child: ElevatedButton(
          onPressed: () {
            googleMapController.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(31.041386149999987, 31.379063099640685),
              ),
            );
          },
          child: Text("Another location"),
        ),
      )
    ]);
  }
}
