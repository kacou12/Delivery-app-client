import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

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
  MapboxMap? mapboxMap;
  var isLight = true;

  void _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    mapboxMap.style.setStyleImportConfigProperty(
      "basemap",
      "theme",
      "monochrome",
    );
  }

  void _onStyleLoadedCallback(StyleLoadedEventData data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Style loaded :), time: ${data.timeInterval}"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _onCameraChangeListener(CameraChangedEventData data) {
    print("CameraChangedEventData: ${data.debugInfo}");
  }

  void _onResourceRequestListener(ResourceEventData data) {
    print("ResourceEventData: time: ${data.timeInterval}");
  }

  void _onMapIdleListener(MapIdleEventData data) {
    print("MapIdleEventData: timestamp: ${data.timestamp}");
  }

  void _onMapLoadedListener(MapLoadedEventData data) {
    print("MapLoadedEventData: time: ${data.timeInterval}");
  }

  void _onMapLoadingErrorListener(MapLoadingErrorEventData data) {
    print("MapLoadingErrorEventData: timestamp: ${data.timestamp}");
  }

  void _onRenderFrameStartedListener(RenderFrameStartedEventData data) {
    print("RenderFrameStartedEventData: timestamp: ${data.timestamp}");
  }

  void _onRenderFrameFinishedListener(RenderFrameFinishedEventData data) {
    print("RenderFrameFinishedEventData: time: ${data.timeInterval}");
  }

  void _onSourceAddedListener(SourceAddedEventData data) {
    print("SourceAddedEventData: timestamp: ${data.timestamp}");
  }

  void _onSourceDataLoadedListener(SourceDataLoadedEventData data) {
    print("SourceDataLoadedEventData: time: ${data.timeInterval}");
  }

  void _onSourceRemovedListener(SourceRemovedEventData data) {
    print("SourceRemovedEventData: timestamp: ${data.timestamp}");
  }

  void _onStyleDataLoadedListener(StyleDataLoadedEventData data) {
    print("StyleDataLoadedEventData: time: ${data.timeInterval}");
  }

  void _onStyleImageMissingListener(StyleImageMissingEventData data) {
    print("StyleImageMissingEventData: timestamp: ${data.timestamp}");
  }

  void _onStyleImageUnusedListener(StyleImageUnusedEventData data) {
    print("StyleImageUnusedEventData: timestamp: ${data.timestamp}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                setState(() => isLight = !isLight);
                if (isLight) {
                  mapboxMap?.style.setStyleImportConfigProperty(
                    "basemap",
                    "lightPreset",
                    "day",
                  );
                } else {
                  mapboxMap?.style.setStyleImportConfigProperty(
                    "basemap",
                    "lightPreset",
                    "night",
                  );
                }
              },
              child: Icon(Icons.swap_horiz),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: MapWidget(
        key: ValueKey("mapWidget"),
        cameraOptions: CameraOptions(
          center: Point(
            coordinates: Position(6.0033416748046875, 43.70908256335716),
          ),
          zoom: 3.0,
        ),
        styleUri: MapboxStyles.STANDARD,
        textureView: true,
        onMapCreated: _onMapCreated,
        onStyleLoadedListener: _onStyleLoadedCallback,
        onCameraChangeListener: _onCameraChangeListener,
        onMapIdleListener: _onMapIdleListener,
        onMapLoadedListener: _onMapLoadedListener,
        onMapLoadErrorListener: _onMapLoadingErrorListener,
        onRenderFrameStartedListener: _onRenderFrameStartedListener,
        onRenderFrameFinishedListener: _onRenderFrameFinishedListener,
        onSourceAddedListener: _onSourceAddedListener,
        onSourceDataLoadedListener: _onSourceDataLoadedListener,
        onSourceRemovedListener: _onSourceRemovedListener,
        onStyleDataLoadedListener: _onStyleDataLoadedListener,
        onStyleImageMissingListener: _onStyleImageMissingListener,
        onStyleImageUnusedListener: _onStyleImageUnusedListener,
        onResourceRequestListener: _onResourceRequestListener,
        onLongTapListener: (coordinate) {},
      ),
    );
  }
}

extension on CameraChangedEventData {
  String get debugInfo {
    return "timestamp ${DateTime.fromMicrosecondsSinceEpoch(timestamp)}, camera: ${cameraState.debugInfo}";
  }
}

extension on CameraState {
  String get debugInfo {
    return "lat: ${center.coordinates.lat}, lng: ${center.coordinates.lng}, zoom: $zoom, bearing: $bearing, pitch: $pitch";
  }
}
