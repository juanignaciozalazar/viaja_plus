import 'package:flutter/material.dart';
import 'package:viaja_plus/Util/styles.dart';

import '../services/database_controller.dart';

class BookTickets extends StatelessWidget {
  const BookTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reservar un Boleto",
          style: subtitulo,
        ),
      ),
      body: ServiceSearch(),
    );
  }
}

class ServiceSearch extends StatefulWidget {
  const ServiceSearch({super.key});

  @override
  State<ServiceSearch> createState() => ServiceSearchState();
}

class ServiceSearchState extends State<ServiceSearch> {
  final origenController = TextEditingController(text: '');
  final destinoController = TextEditingController(text: null);
  final fechaPartidaController = TextEditingController(text: null);
  final cantAsientosController = TextEditingController(text: null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Bloque de busqueda de servicio
        // Inserta nombre de localidad origen, de destino, fechas de salida y
        // y de retorno opcionalmente, y cantidad de asientos.
        Container(
          decoration: const BoxDecoration(
            color: Colors.orange,
          ),
          child: Column(
            children: [
              FutureBuilder(
                future:
                    SupabaseController.getLocalidades(origenController.text),
                builder: (context, snapshot) {
                  // print(snapshot.data);
                  if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                    return DropdownMenu(
                      controller: origenController,
                      dropdownMenuEntries: snapshot.data!
                          .map(
                            (e) => DropdownMenuEntry(
                              label: e['nombre'],
                              value: e['id_localidad'],
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              TextFormField(),
            ],
          ),
        ),
        Flex(
          direction: Axis.vertical,
        ),
      ],
    );
  }
}
