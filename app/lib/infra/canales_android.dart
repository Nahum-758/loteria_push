import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> crearCanalesAndroid() async {
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(
    settings: const InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher')),
  );
  final android = plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  await android?.createNotificationChannel(const AndroidNotificationChannel(
    'cartas',
    'Cartas cantadas',
    description: 'Cada carta que canta el cantor (discreto, una reemplaza a la anterior)',
    importance: Importance.defaultImportance,
  ));
  await android?.createNotificationChannel(const AndroidNotificationChannel(
    'momentos',
    'Momentos importantes',
    description: '¡Casi! y ¡Lotería! (sí suenan)',
    importance: Importance.high,
  ));
}