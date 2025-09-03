import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

// class ProductsScreen extends StatelessWidget {
//   const ProductsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.sizeOf(context).height;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "sectionTitle products",
//           style: Theme.of(context).textTheme.titleLarge?.copyWith(
//               fontWeight: FontWeight.w500,
//               // color: const Color.fromARGB(255, 113, 113, 113)),
//               color: Colors.black),
//         ),
//         const Text("products"),
//         SizedBox(
//           height: height * 0.02,
//         ),
//       ],
//     );
//   }
// }

class ProductsScreen extends StatefulWidget {
  @override
  final Widget leading = const Icon(Icons.map);
  @override
  final String title = 'Full screen map';
  @override
  final String? subtitle = null;

  const ProductsScreen({super.key});

  @override
  State createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  mp.MapboxMap? mapboxMapController;
  StreamSubscription<gl.Position>? userPositionStream;

  @override
  void initState() {
    super.initState();
    _setupPositionTracking();
  }

  @override
  void dispose() {
    userPositionStream?.cancel();
    super.dispose();
  }

  void _onMapCreated(mp.MapboxMap controller) async {
    setState(() {
      mapboxMapController = controller;
    });

    // display user position on map
    mapboxMapController?.location.updateSettings(
      mp.LocationComponentSettings(enabled: true, pulsingEnabled: true),
    );

    // add custom annotaion (icon map)
    final pointAnnotationManager = await mapboxMapController?.annotations
        .createPointAnnotationManager();
    final Uint8List imageData = await loadHQMarkerImage();

    final mp.PointAnnotationOptions pointAnnotationOptions =
        mp.PointAnnotationOptions(
          geometry: mp.Point(coordinates: mp.Position(-3.937725, 5.362296)),
          image: imageData,
          iconSize: 0.3,
        );

    await pointAnnotationManager?.create(pointAnnotationOptions);
  }

  Future<void> _setupPositionTracking() async {
    bool serviceEnabled;
    gl.LocationPermission permission;

    serviceEnabled = await gl.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await gl.Geolocator.checkPermission();
    if (permission == gl.LocationPermission.denied) {
      permission = await gl.Geolocator.requestPermission();
      if (permission == gl.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == gl.LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    gl.LocationSettings locationSettings = const gl.LocationSettings(
      accuracy: gl.LocationAccuracy.high,
      distanceFilter: 100,
    );

    userPositionStream?.cancel();

    userPositionStream =
        gl.Geolocator.getPositionStream(
          locationSettings: locationSettings,
        ).listen((gl.Position? position) {
          // print('position: ${position?.latitude}, ${position?.longitude}');
          if (position != null && mapboxMapController != null) {
            mapboxMapController!.setCamera(
              mp.CameraOptions(
                center: mp.Point(
                  coordinates: mp.Position(
                    position.longitude,
                    position.latitude,
                  ),
                ),
                zoom: 15,
              ),
            );
          }
        });
  }

  Future<Uint8List> loadHQMarkerImage() async {
    var byteData = await rootBundle.load(
      'assets/icons/maps/restaurant_marker.png',
    );
    return byteData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mp.MapWidget(
        onMapCreated: _onMapCreated,
        styleUri: mp.MapboxStyles.OUTDOORS,
      ),
    );
  }
}
