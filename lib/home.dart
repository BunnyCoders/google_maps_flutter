import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.265310789940852, 77.47129242231686),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          trafficEnabled: false,
          rotateGesturesEnabled: true,
          buildingsEnabled: true,
          // markers: Set<Marker>.of(_markers),
          // onMapCreated: (GoogleMapController controller) {
          //   _controller.complete(controller);
          // },
        ),
      ),
    );
  }
}
