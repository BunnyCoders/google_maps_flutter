// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  _PolygonScreenState createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {

  final Completer<GoogleMapController> _controller = Completer();


  final CameraPosition _kGooglePlex =  const CameraPosition(
    target: LatLng(8.984744630984105, -79.51568584889174),
    zoom: 14,
  );
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygon = HashSet<Polygon>() ;

  List<LatLng> points = [
    const LatLng(9.000471, -79.495544),
    const LatLng(8.999406, -79.495831),

    const LatLng(8.998838, -79.494680),
    const LatLng(8.997630, -79.493314),
    const LatLng(8.995286, -79.495831),
    const LatLng(8.994078, -79.496335),
    const LatLng(8.992941, -79.495615),
    const LatLng(8.990029, -79.497701),
    const LatLng(8.985198, -79.502664),
    const LatLng(8.981359, -79.506608),
    const LatLng(8.969308, -79.514766),
    const LatLng(8.965132, -79.518738),
    const LatLng(8.979038, -79.529805),
    const LatLng(8.995424, -79.520294),

    const LatLng(9.000471, -79.495544),

  ] ;


  void _setPolygon(){
    _polygon.add(
        Polygon(polygonId: const PolygonId('1') ,
            points: points ,
            strokeColor: Colors.deepOrange,
            strokeWidth: 5 ,
            fillColor: Colors.deepOrange.withOpacity(0.1),
            geodesic: true
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPolygon() ;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Polygon'),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
        //   northeast: LatLng(9.006808, -79.508148),
        //   southwest:  LatLng(9.003121, -79.505702),
        // )),
        //  onCameraMove: ((_position) => _updatePosition(_position)),
        markers:_markers ,
        polygons: _polygon,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}