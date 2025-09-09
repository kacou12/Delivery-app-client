import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class MapboxTracking extends StatefulWidget {
  const MapboxTracking({
    required this.restaurant,
    required this.tokenSocketDeliveryPerson,
    super.key,
  });
  final RestaurantMapData restaurant;
  final String tokenSocketDeliveryPerson;

  @override
  State createState() => MapboxTrackingState();
}

class MapboxTrackingState extends State<MapboxTracking> {
  mp.MapboxMap? mapboxMapController;
  StreamSubscription<gl.Position>? userPositionStream;

  @override
  void initState() {
    super.initState();
    _setupPositionTracking();
  }

  final List<MarkerData> markersData = [
    MarkerData(
      id: "marker1_delivery",
      latitude: 5.362296,
      longitude: -3.937725,
      title: "Tour Eiffel",
      description: "Monument emblématique de Paris",
      category: "Monument",
      address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
      phone: "+33 8 92 70 12 39",
      website: "https://www.toureiffel.paris",
    ),
  ];

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

    // // add custom annotaion (icon map)
    // final pointAnnotationManager = await mapboxMapController?.annotations
    //     .createPointAnnotationManager();
    // final Uint8List imageData = await loadHQMarkerImage();

    // final mp.PointAnnotationOptions pointAnnotationOptions =
    //     mp.PointAnnotationOptions(
    //       geometry: mp.Point(coordinates: mp.Position(-3.937725, 5.362296)),
    //       image: imageData,
    //       iconSize: 0.3,
    //     );

    // final mp.PointAnnotation? annotation = await pointAnnotationManager?.create(
    //   pointAnnotationOptions,
    // );

    if (mapboxMapController == null) return;

    // Ajouter les marqueurs à la carte
    for (var markerData in markersData) {
      await mapboxMapController!.annotations.createPointAnnotationManager().then((
        manager,
      ) async {
        // Créer l'annotation

        final Uint8List imageData = await loadHQMarkerImage();

        final mp.PointAnnotationOptions
        pointAnnotationOptions = mp.PointAnnotationOptions(
          // geometry: mp.Point(coordinates: mp.Position(-3.937725, 5.362296)),
          geometry: mp.Point(
            coordinates: mp.Position(markerData.longitude, markerData.latitude),
          ),
          image: imageData,
          iconSize: 0.3,
        );

        // Ajouter l'annotation
        await manager.create(pointAnnotationOptions);

        // Écouter les clics sur les annotations
        manager.tapEvents(
          onTap: (annotation) {
            mapboxMapController!.setCamera(
              mp.CameraOptions(
                center: mp.Point(
                  coordinates: mp.Position(
                    annotation.geometry.coordinates.lng,
                    annotation.geometry.coordinates.lat,
                  ),
                ),
                zoom: 15,
              ),
            );
            _showMarkerModal(markerData);
          },
        );
      });
    }
  }

  void _showMarkerModal(MarkerData markerData) {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: Colors.transparent,
    //   builder: (context) => MarkerInfoModal(markerData: markerData),
    // );
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false, // Prevents immediate full-screen expansion
          initialChildSize: 0.5, // Optional: set initial height
          minChildSize: 0.25, // Optional: set minimum height
          maxChildSize: 0.9, // Optional: set maximum height
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              // Or ListView, etc.
              controller:
                  scrollController, // Link to DraggableScrollableSheet's controller
              child: MarkerInfoModal(markerData: markerData),
            );
          },
        );
      },
    );
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

    //TODO REPLACE getPositionStream BY USER POSITION STREAM FROM LOCATION
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

class MarkerData {
  final String id;
  final double latitude;
  final double longitude;
  final String title;
  final String description;
  final String category;
  final String address;
  final String phone;
  final String website;

  MarkerData({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.phone,
    required this.website,
  });
}

// Widget Modal personnalisé
// Widget Modal personnalisé
class MarkerInfoModal extends StatelessWidget {
  final MarkerData markerData;

  const MarkerInfoModal({super.key, required this.markerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Barre de glissement
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Contenu du modal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // En-tête avec titre et catégorie
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          markerData.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          markerData.category,
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    markerData.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  // Informations détaillées
                  _buildInfoSection(
                    icon: Icons.location_on,
                    title: "Adresse",
                    content: markerData.address,
                    onTap: () => _openMaps(context),
                  ),

                  const SizedBox(height: 16),

                  _buildInfoSection(
                    icon: Icons.phone,
                    title: "Téléphone",
                    content: markerData.phone,
                    onTap: () => _makePhoneCall(markerData.phone),
                  ),

                  const SizedBox(height: 16),

                  _buildInfoSection(
                    icon: Icons.web,
                    title: "Site web",
                    content: markerData.website,
                    onTap: () => _openWebsite(markerData.website),
                  ),

                  const SizedBox(height: 32),
                  _buildInfoSection(
                    icon: Icons.web,
                    title: "Site web",
                    content: markerData.website,
                    onTap: () => _openWebsite(markerData.website),
                  ),

                  const SizedBox(height: 32),
                  _buildInfoSection(
                    icon: Icons.web,
                    title: "Site web",
                    content: markerData.website,
                    onTap: () => _openWebsite(markerData.website),
                  ),

                  const SizedBox(height: 32),

                  // Coordonnées
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Coordonnées:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${markerData.latitude.toStringAsFixed(4)}, ${markerData.longitude.toStringAsFixed(4)}",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Bouton de fermeture
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Fermer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoSection({
  required IconData icon,
  required String title,
  required String content,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[600], size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        ],
      ),
    ),
  );
}

void _openMaps(BuildContext context) {
  // Implémenter l'ouverture dans l'application de cartes
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Ouverture dans l'app de cartes...")),
  );
}

void _makePhoneCall(String phone) {
  // Implémenter l'appel téléphonique
  // Vous pouvez utiliser url_launcher: launch("tel:$phone")
}

void _openWebsite(String website) {
  // Implémenter l'ouverture du site web
  // Vous pouvez utiliser url_launcher: launch(website)
}

class RestaurantMapData {
  final double longitude;
  final double latitude;
  final String name;
  final String address;
  final String phone;
  final String website;

  RestaurantMapData({
    required this.longitude,
    required this.latitude,
    required this.name,
    required this.address,
    required this.phone,
    required this.website,
  });
}
