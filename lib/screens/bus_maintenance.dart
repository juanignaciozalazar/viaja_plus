import 'package:flutter/material.dart';

import '../models/unidad_transporte.dart';
import '../services/database_controller.dart';

class BusMaintenance extends StatelessWidget {
  const BusMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: BusCreationForm(
            cantFilasPisoUno: 4,
            cantHilerasPisoUno: 10,
          ),
        ),
      ),
    );
  }
}

class BusCreationForm extends StatefulWidget {
  const BusCreationForm(
      {super.key,
      required this.cantFilasPisoUno,
      required this.cantHilerasPisoUno,
      this.cantFilasPisoDos,
      this.cantHilerasPisoDos});

  final int cantFilasPisoUno;
  final int cantHilerasPisoUno;
  final int? cantFilasPisoDos;
  final int? cantHilerasPisoDos;

  @override
  State<BusCreationForm> createState() => _BusCreationFormState();
}

class _BusCreationFormState extends State<BusCreationForm> {
  List<Map<String, dynamic>> disposicion = [];

  CantPisos pisoSeleccionado = CantPisos.uno;
  var corteFilaPisoUno;
  var corteFilaPisoDos;

  Map<int,TableColumnWidth> columnWidthsPisoUno;
  Map<int,TableColumnWidth> columnWidthsPisoDos;

  @override
  void initState() {
    super.initState();

    corteFilaPisoUno = (widget.cantFilasPisoUno / 2).floor();
    corteFilaPisoDos = (widget.cantFilasPisoDos != null)
        ? (widget.cantFilasPisoDos! / 2).floor()
        : null;

    for(int i = 0; i < widget.cantFilasPisoUno; i++) {

    }

    for (int i = 1; i <= widget.cantHilerasPisoUno; i++) {
      for (int j = 1; j <= widget.cantFilasPisoUno; j++) {
        disposicion.add({
          'piso': CantPisos.uno,
          'hilera': i,
          'fila': j,
          'enabled': true,
          'ghost': false,
        });
        if (j == corteFilaPisoUno + 1) {
          disposicion.add({'ghost': true});
        }
      }
    }

    if (widget.cantFilasPisoDos != null && widget.cantHilerasPisoDos != null) {

      for(int i = 0; i < widget.cantFilasPisoDos; i++) {
      
    }

      for (int i = 1; i <= widget.cantHilerasPisoDos!; i++) {
        for (int j = 1; j <= widget.cantFilasPisoDos!; j++) {
          disposicion.add({
            'piso': CantPisos.dos,
            'hilera': i,
            'fila': j,
            'enabled': true,
          });

          if (j == corteFilaPisoDos + 1) {
            disposicion.add({'ghost': true});
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Disposicion piso uno
        Table(
          columnWidths: 
        ),
        // Disposicion piso dos
        (widget.cantFilasPisoDos != null && widget.cantHilerasPisoDos != null)
            ? Table()
            : SizedBox(),
      ],
    );
  }
}
