import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:my/core/services/firebase/firebase_services.dart';
import 'package:my/core/services/injection_container.dart';
import 'package:my/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    MapboxOptions.setAccessToken(dotenv.env['MAPBOX_ACCESS_TOKEN']!);
    await injectionContainer();
    await FirebaseServices.init();

    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) => runApp(MyApp()));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
