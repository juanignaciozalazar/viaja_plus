import 'package:viaja_plus/models/asiento.dart';

enum Categorias {
  comun,
  semicama,
  cochecama,
}

enum CantPisos {
  uno,
  dos,
}

class UnidadTransporte {
  Categorias categoria;
  CantPisos cantPisos;
  String? patente;
  List<Asiento>? disposicion;

  UnidadTransporte({
    required this.categoria,
    required this.cantPisos,
    this.patente,
    this.disposicion,
  });
}
