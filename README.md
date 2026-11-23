#Lotería push

Camarillo Solano Ángel Nahúm

Ronda 2
ROJO Pruebas de la baraja
<img width="523" height="105" alt="image" src="https://github.com/user-attachments/assets/4e4894cd-7d58-4cc2-baa9-a68d3e57a5f9" />

VERDE Implementación.
<img width="820" height="322" alt="image" src="https://github.com/user-attachments/assets/55aba2af-d0de-4920-ba00-d59654f2c3a2" />
<img width="864" height="288" alt="image" src="https://github.com/user-attachments/assets/30515a43-2c81-42e5-9486-c0e75d3e7c01" />

ROJO Pruebas de líneas (la app Dart usa los MISMOS casos).
<img width="553" height="334" alt="Captura de pantalla 2026-11-23 010425" src="https://github.com/user-attachments/assets/e55beb33-2d55-4213-9692-6446ecc2a273" />

VERDE Implementación.
<img width="820" height="322" alt="image" src="https://github.com/user-attachments/assets/8ec2b911-1cd6-450d-ab82-4affcb70a3bf" />
<img width="864" height="288" alt="image" src="https://github.com/user-attachments/assets/5414285f-00da-434e-9d3e-ceea1ba9407e" />


Ronda 3
ROJO Pruebas de mensajes.
<img width="581" height="118" alt="image" src="https://github.com/user-attachments/assets/b14ad2af-d9c0-4968-88b1-b682b9f20a41" />

VERDE Implementación
<img width="820" height="322" alt="image" src="https://github.com/user-attachments/assets/ce619b9f-ad82-4b4f-a955-b06c4229b863" />
<img width="864" height="288" alt="image" src="https://github.com/user-attachments/assets/ffa44e12-857e-4f2a-89e5-61e9fc1dc7dd" />

Ronda 4
ROJO Pruebas de la sala.
<img width="822" height="320" alt="image" src="https://github.com/user-attachments/assets/9644890c-6313-45c9-b2e3-bb2bf41c701b" />

VERDE Implementación
<img width="818" height="314" alt="image" src="https://github.com/user-attachments/assets/697bbe08-2efb-4a94-8c5f-6f81f1823e58" />
<img width="864" height="288" alt="image" src="https://github.com/user-attachments/assets/c240b87b-8843-439e-ac5c-e899e6b19164" />


Ronda 5
ROJO Pruebas del servidor, de punta a punta (levantan el servidor real y le hablan con fetch).
<img width="565" height="232" alt="image" src="https://github.com/user-attachments/assets/b5d8c274-ccba-4f09-a452-60b11c344e5d" />

VERDE Implementación
<img width="818" height="314" alt="image" src="https://github.com/user-attachments/assets/88830201-3fda-40b6-b9f2-c3dc030f8e75" />
<img width="864" height="288" alt="image" src="https://github.com/user-attachments/assets/86d83b41-6fb6-404c-9fa0-b9ec16a808aa" />


Ronda 6
ROJO Pruebas de eventos y de patrones (los mismos casos que el servidor).
<img width="950" height="205" alt="Captura de pantalla 2026-11-23 014932" src="https://github.com/user-attachments/assets/b662cd03-3e39-438b-8fcc-2df8d1e4e000" />

VERDE Implementación.
<img width="736" height="249" alt="Captura de pantalla 2026-11-23 014733" src="https://github.com/user-attachments/assets/30bb405e-9874-4664-951d-af757c09cadc" />

ROJO Pruebas de la partida.
<img width="553" height="334" alt="Captura de pantalla 2026-11-23 010425" src="https://github.com/user-attachments/assets/5a39130d-5b34-4ab4-b49c-ff07841a02ff" />

VERDE Implementación.
<img width="287" height="84" alt="Captura de pantalla 2026-11-23 002147" src="https://github.com/user-attachments/assets/9873b43e-5944-4af6-a523-84baaf54d5b0" />


Ronda 7
ROJO Pruebas del controlador.
<img width="604" height="371" alt="Captura de pantalla 2026-11-23 001039" src="https://github.com/user-attachments/assets/333b847b-ad85-4bcd-bab0-c7e50032db52" />

VERDE Implementación.
<img width="287" height="84" alt="Captura de pantalla 2026-11-23 002147" src="https://github.com/user-attachments/assets/579e9d56-7f7e-43b6-b23f-4b826aeec490" />


Cierre: lista de verificación y preguntas
Preguntas para discutir en clase
28. ¿Por qué decimos que "el push es un aviso y el servidor es la verdad"? Da un ejemplo distinto a la
Lotería.
Las notificaciones push pueden perderse, retrasarse, colapsarse o entregarse fuera de orden, por lo que no garantizan una secuencia exacta ni un estado completo. El servidor mantiene el estado autoritativo y actualizado; el push solo alerta al cliente para que sincronice o consulte la fuente oficial.
Ejemplo: En una aplicación bancaria o de pagos, un push puede avisar "Transferencia recibida", pero el saldo real, los movimientos confirmados y el estado final de la operación solo se validan consultando el servidor.

29. Explica qué es el colapso de mensajes y por qué hace necesario consultar al servidor.
El colapso de mensajes (como con collapse_key en FCM) ocurre cuando el proveedor descarta o sobrescribe mensajes pendientes no entregados para un mismo destino/clave y entrega solo el más reciente. Como los avisos intermedios pudieron omitirse, el cliente no puede reconstruir todo el historial solo con el push y necesita consultar al servidor para obtener el estado actual completo.
30. ¿Qué pasa con una carta cantada hace 10 minutos si el teléfono estaba apagado? ¿Qué papel juega el
TTL? i el teléfono estaba apagado y el tiempo de vida (TTL, Time To Live) de la notificación ya expiró antes de que el dispositivo volviera a conectarse, el servicio push descarta el mensaje y no lo entregará. El TTL define cuántos segundos permanece en cola un mensaje no entregado: evita que lleguen avisos obsoletos de una jugada vieja y ahorra recursos; al encender el teléfono, la app debe sincronizar con el servidor para ver qué cartas se cantaron mientras estuvo apagado.
31. ¿Por qué los valores de data deben ser texto y qué haría tu app si llegara "n": "abc"? En los payloads data de FCM, las claves y valores se transmiten como cadenas de texto (String). Si llega "n": "abc" donde se esperaba un número (por ejemplo, el número de carta o turno), la app debe validar y parsear de forma segura (por ejemplo con int.tryParse o validación equivalente), manejar el dato inválido sin que crashee la interfaz y, de ser necesario, pedir/usar el estado sincronizado del servidor.
32. ¿Qué ventaja tiene que el servidor, y no la app, decida si hay Lotería? ¿Qué trampa evita?
Centralizar la validación en el servidor garantiza una única regla de negocio confiable para todos los jugadores y evita estados inconsistentes entre dispositivos. Evita trampas como modificar el cliente, manipular la tabla o el estado local, o cantar Lotería sin haber cumplido realmente el patrón en las cartas cantadas por la sala.
33. ¿Qué diferencia hay entre enviar a un tema y enviar a un token? ¿Cuándo usarías cada uno?
Enviar a un tema (topic): envía un mensaje a todos los dispositivos suscritos a un canal/tópico. Enviar a un token: envía un mensaje dirigido a una instancia/dispositivo específico mediante su token de registro.
34. ¿Por qué un tema NO sirve para información privada? Los temas están pensados para difusión grupal y cualquier cliente que conozca o pueda suscribirse al nombre del tema recibiría los mensajes enviados a él, además de que el modelo de temas no está diseñado como canal de confidencialidad por usuario ni para aislar datos sensibles de una persona.
35. ¿Por qué no se borra al jugador cuando FCM responde "invalid-argument"? Un invalid-argument suele indicar un problema en la petición o formato de los parámetros enviados por el servidor (no necesariamente que el jugador haya abandonado la partida o que su cuenta sea inválida). Borrar al jugador por un error de payload/argumento perdería su sesión o progreso innecesariamente; lo correcto es registrar/corregir el envío y mantener la integridad de la partida.
36. Con la app en segundo plano, ¿qué callback se ejecuta cuando llega un mensaje de notificación? ¿Y
cuando el usuario lo toca? En firebase_messaging (Flutter): Al llegar un mensaje con la app en segundo plano o terminada, se ejecuta el manejador en segundo plano registrado con FirebaseMessaging.onBackgroundMessage(...). Cuando el usuario toca la notificación (estando en segundo plano o cerrada), se dispara el flujo de apertura de notificación mediante FirebaseMessaging.onMessageOpenedApp.listen(...) y, si la app estaba cerrada, también puede consultarse con FirebaseMessaging.instance.getInitialMessage().
37. ¿Qué ganas al aislar firebase_messaging detrás de PuertoPush, sobre todo ahora que el paquete
migra a FID? Aislarlo detrás de PuertoPush (dominio/puerto) desacopla tu lógica de juego y controladores de una librería concreta. Así, cuando firebase_messaging cambie APIs o migre a FID (Firebase Installations) o a otro proveedor/SDK, solo actualizas el adaptador de infraestructura sin reescribir el dominio ni las pruebas de negocio.
