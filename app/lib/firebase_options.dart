import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Plantilla local para compilación/pruebas antes de correr `flutterfire configure`.
/// Reemplaza este archivo ejecutando `flutterfire configure` cuando conectes tu proyecto real de Firebase.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Configura Firebase con flutterfire configure para Web.');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const FirebaseOptions(
          apiKey: 'AIzaSyLocalDevPlaceholderKey123456789',
          appId: '1:1234567890:android:abcdef1234567890',
          messagingSenderId: '1234567890',
          projectId: 'loteria-push-local',
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const FirebaseOptions(
          apiKey: 'AIzaSyLocalDevPlaceholderKey123456789',
          appId: '1:1234567890:ios:abcdef1234567890',
          messagingSenderId: '1234567890',
          projectId: 'loteria-push-local',
        );
      default:
        throw UnsupportedError('Plataforma no soportada por DefaultFirebaseOptions.');
    }
  }
}