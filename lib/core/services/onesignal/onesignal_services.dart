import 'package:go_router/go_router.dart';
import 'package:my/core/services/router/page_routes.enum.dart';
import 'package:my/core/services/router/router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OneSignalServices {
  static void setup() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    // Remplacez 'VOTRE_APP_ID' par votre véritable App ID OneSignal
    OneSignal.initialize(dotenv.env['ONE_SIGNAL_KEY']!);

    // Demande la permission de l'utilisateur pour les notifications
    OneSignal.Notifications.requestPermission(false);
  }

  static void addForegroundWillDisplayListener() {
    // Gestionnaire de réception de notification
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      // La notification s'affiche
      print("Notification reçue en premier plan: ${event.notification.title}");

      // Empêche la notification de s'afficher (si vous le souhaitez)
      // event.preventDefault();
    });
  }

  static void addClickListener() {
    OneSignal.Notifications.addClickListener((event) {
      // La notification a été cliquée
      print("Notification cliquée: ${event.notification.title}");

      // Exemple de navigation vers une page spécifique
      // if (event.notification.additionalData?['screen'] == 'profile') {
      //   // Naviguer vers la page de profil
      //   rootNavigatorKey.currentContext?.goNamed(PageRoutes.products.name);
      // }
      rootNavigatorKey.currentContext?.goNamed(PageRoutes.products.name);
    });
  }
}
