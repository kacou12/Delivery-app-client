import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:my/core/services/firebase/firebase_services.dart';
import 'package:my/core/services/injection_container.dart';
import 'package:my/core/services/onesignal/onesignal_services.dart';
import 'package:my/core/services/router/page_routes.enum.dart';
import 'package:my/core/services/router/router.dart';
import 'package:my/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    MapboxOptions.setAccessToken(dotenv.env['MAPBOX_ACCESS_TOKEN']!);
    await injectionContainer();
    await FirebaseServices.init();
    await Geolocator.getCurrentPosition();

    OneSignalServices.setup();
    OneSignalServices.addForegroundWillDisplayListener();
    OneSignalServices.addClickListener();

    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) => runApp(MyApp()));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
