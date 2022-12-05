import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng aLocation = LatLng(43.250541, 76.883606);
  static const LatLng bLocation = LatLng(43.253284, 76.922494);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(43.250541, 76.883606),
    zoom: 14.4746,
  );


  static final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: "A позиция"),
      icon: BitmapDescriptor.defaultMarker,
      position: aLocation);


  static final Marker _kSecposMarker = Marker(
      markerId: MarkerId('_kSecposPlex'),
      infoWindow: InfoWindow(title: "B позиция"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: bLocation);


  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [aLocation, bLocation],
      width: 4,
      color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {_kGooglePlexMarker, _kSecposMarker},
        polylines: {_kPolyline},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}