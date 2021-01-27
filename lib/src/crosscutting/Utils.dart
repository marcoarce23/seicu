
final String userName = null;

String obtenerMunicipio(int idMunicipio) {
  String _departamento = 'Cochabamba';

  if (idMunicipio == 1) _departamento = 'Pando';
  if (idMunicipio == 2) _departamento = 'Beni';
  if (idMunicipio == 3) _departamento = 'Santa Cruz';
  if (idMunicipio == 4) _departamento = 'La Paz';
  if (idMunicipio == 5) _departamento = 'Oruro';
  if (idMunicipio == 6) _departamento = 'Potosi';
  if (idMunicipio == 7) _departamento = 'Cochabamba';
  if (idMunicipio == 8) _departamento = 'Tarija';
  if (idMunicipio == 9) _departamento = 'Chuquisaca';
  if (idMunicipio == 10) _departamento = 'Torno';
  if (idMunicipio == 11) _departamento = 'Sacaba';
  return _departamento;
}

// enviarNotificaciones(String urlGetToken, String clave, String titulo,
//     String valorTitulo, String subTitulo, String subTituloValor) {
//   Token entityToken;
//   final dataMapToken =
//       new Generic().getAll(new Token(), urlGetToken, primaryKeyGetToken);

//   dataMapToken.then((value) {
//     if (value.length > 0) {
//       for (int i = 0; i < value.length; i++) {
//         entityToken = value[i];
//         //    //print('entrooo las veces de: $entityToken');
//         new Generic().sebnFCM(entityToken.llaveToken, clave,
//             '$titulo - $valorTitulo - $subTitulo $subTituloValor - Fecha - ${DateTime.now()}');
//       }
//     }
//   });
// }

int daysInMonth(int month) {
  var now = DateTime.now();

  var lastDayDateTime = (month < 12)
      ? new DateTime(now.year, month + 1, 0)
      : new DateTime(now.year + 1, 1, 0);

  return lastDayDateTime.day;
}

