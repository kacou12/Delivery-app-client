import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:woudy_customers_app/core/api/cache_manager.dart';

import 'package:woudy_customers_app/core/services/firebase/firebase_services.dart';
import 'package:woudy_customers_app/core/services/geolocator_service.dart';
import 'package:woudy_customers_app/core/services/injection_container.dart';
import 'package:woudy_customers_app/core/services/onesignal/onesignal_services.dart';
import 'package:woudy_customers_app/my_app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheManager.initialize();
    await dotenv.load(fileName: ".env");
    MapboxOptions.setAccessToken(dotenv.env['MAPBOX_ACCESS_TOKEN']!);
    await injectionContainer();
    await FirebaseServices.init();

    await GeolocatorService.determinePosition();
    // await Geolocator.getCurrentPosition();

    OneSignalServices.setup();
    OneSignalServices.addForegroundWillDisplayListener();
    OneSignalServices.addClickListener();

    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) => runApp(MyApp()));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
