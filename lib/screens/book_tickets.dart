import 'package:flutter/material.dart';
import 'package:viaja_plus/Util/styles.dart';

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
    );
  }
}
