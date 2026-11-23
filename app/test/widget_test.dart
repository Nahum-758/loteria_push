import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_push/app.dart';
import 'package:loteria_push/dominio/almacen.dart';
import 'package:loteria_push/dominio/controlador.dart';
import 'package:loteria_push/presentacion/vms.dart';
import 'falsos.dart';

void main() {
  testWidgets('muestra la pantalla de inicio de Lotería Push', (tester) async {
    final api = ApiFalsa();
    final controlador = ControladorPartida(api: api, push: PuertoPushFalso(), almacen: AlmacenMemoria());
    final vm = JuegoVm(controlador);

    await tester.pumpWidget(AppLoteria(vm: vm, crearCantor: () => CantorVm(api)));
    await tester.pumpAndSettle();

    expect(find.text('Lotería Push'), findsOneWidget);
    expect(find.text('Unirme a la sala'), findsOneWidget);
  });
}