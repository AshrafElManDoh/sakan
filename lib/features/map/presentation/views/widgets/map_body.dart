import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sakan/core/utils/location_service.dart';

class MapBody extends StatefulWidget {
  final double? latitude;
  final double? longitude;

  const MapBody({super.key, this.latitude, this.longitude});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  late GoogleMapController googleMapController;
  late CameraPosition initCameraPosition;
  late LocationService locationService;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
    initCameraPosition = CameraPosition(
      target: widget.latitude != null && widget.longitude != null
          ? LatLng(widget.latitude!, widget.longitude!)
          : const LatLng(31.04268759549466, 31.35816661637377),
      zoom: 16,
    );
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initCameraPosition,
      myLocationEnabled: widget.latitude == null, 
      myLocationButtonEnabled: true,
      onMapCreated: (controller) async {
        googleMapController = controller;
        if (widget.latitude != null && widget.longitude != null) {
          // show marker at apartment location
          markers.add(Marker(
            markerId: const MarkerId("apartment"),
            position: LatLng(widget.latitude!, widget.longitude!),
          ));
          setState(() {});
        } else {
          await updateCurrentLocation(); // user's location
        }
      },
      markers: markers,
    );
  }

  Future<void> updateCurrentLocation() async {
    try {
      final locationData = await locationService.getMyLocation();
      final currentPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 16,
      );
      await googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(currentPosition),
      );
    } catch (e) {
      print("Error fetching location: $e");
    }
  }
}
