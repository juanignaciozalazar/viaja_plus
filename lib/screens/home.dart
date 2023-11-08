import 'package:flutter/material.dart';
import '../Util/styles.dart';
import 'book_tickets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackOlive,
        title: const Text(
          "Bienvenido a Viaja Plus!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: teaGreen,
            fontSize: 24,
            shadows: <Shadow>[
              Shadow(
              offset: Offset(10.0, 5.0),
              blurRadius: 3.0,
            ),
          ]

          ),
        ),
        actions: [
          TextButton(
            onPressed: () => () => {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const BookTickets(),
                    ),
                  ),
                },
            child: const Text(
              "Reservar Pasajes",
              style: textoBotones,
            ),
          ),
          TextButton(
            onPressed: () => () => {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const BookTickets(),
                    ),
                  ),
                },
            child: const Text(
              "Mantenimiento de Unidades",
              style: textoBotones
              ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints){
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset("assets/background.jpeg").image,
                      fit: BoxFit.cover,
                      alignment: AlignmentDirectional.bottomCenter 
                      ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                )
              ],
              )
          );
        },
      )
    );
  }
}
