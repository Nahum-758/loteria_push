import 'package:firebase_messaging/firebase_messaging.dart';
import '../dominio/api_juego.dart';
import '../dominio/puerto_push.dart';

class PuertoFcm implements PuertoPush {
  PuertoFcm() : _fcm = FirebaseMessaging.instance;
  final FirebaseMessaging _fcm;

  PermisoPush _mapear(AuthorizationStatus s) {
    final nombre = s.name;
    if (nombre == 'authorized' || nombre == 'provisional') return PermisoPush.concedido;
    if (nombre == 'denied' || nombre == 'deniedPermanently') return PermisoPush.denegado;
    return PermisoPush.sinPreguntar;
  }

  MensajePush _aMensaje(RemoteMessage m) => MensajePush(
        datos: Map<String, Object?>.from(m.data),
        titulo: m.notification?.title,
        cuerpo: m.notification?.body,
      );

  @override
  Future<PermisoPush> estadoPermiso() async => _mapear((await _fcm.getNotificationSettings()).authorizationStatus);

  @override
  Future<PermisoPush> pedirPermiso() async {
    final s = await _fcm.requestPermission(alert: true, badge: false, sound: true);
    return _mapear(s.authorizationStatus);
  }

  @override
  Future<DestinoPush?> obtenerDestino() async {
    final token = await _fcm.getToken();
    return token == null ? null : DestinoPush('token', token);
  }

  @override
  Stream<DestinoPush> get destinoCambiado => _fcm.onTokenRefresh.map((t) => DestinoPush('token', t));

  @override
  Stream<MensajePush> get enPrimerPlano => FirebaseMessaging.onMessage.map(_aMensaje);

  @override
  Stream<MensajePush> get alAbrirDesdeNotificacion => FirebaseMessaging.onMessageOpenedApp.map(_aMensaje);

  @override
  Future<MensajePush?> mensajeInicial() async {
    final m = await _fcm.getInitialMessage();
    return m == null ? null : _aMensaje(m);
  }

  @override
  Future<void> suscribirTema(String tema) => _fcm.subscribeToTopic(tema);

  @override
  Future<void> desuscribirTema(String tema) => _fcm.unsubscribeFromTopic(tema);
}