import 'package:viaja_plus/models/unidad_transporte.dart';

class Asiento {
  int idUnidad;
  CantPisos piso;
  int fila;
  int hilera;

  Asiento({
    required this.idUnidad,
    required this.piso,
    required this.fila,
    required this.hilera,
  });
}
