import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viaja_plus/Util/styles.dart';
import 'package:viaja_plus/models/user_profile.dart';
import 'package:viaja_plus/services/auth.dart';

import '../../models/user_data.dart';
import '../book_tickets.dart';
import '../login.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);

    // Para programadores y admins
    if ([UserRoles.programador, UserRoles.admin]
        .contains(user?.profile?.role)) {
      return AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () => {
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
            onPressed: () => {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const BookTickets(),
                ),
              ),
            },
            child: const Text('Mantenimiento de Unidades', style: textoBotones),
          ),
          (user == null)
              ? TextButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () => Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Login(),
                    ),
                  ),
                  child: const Text('Iniciar Sesión'),
                )
              : TextButton(
                  onPressed: () {
                    AuthService.signOut();
                  },
                  child: const Text('Cerrar Sesión'),
                )
        ],
      );
    }
    // Para clientes autenticados o no autenticados
    else {
      return AppBar(
        backgroundColor: blackOlive,
        title: const Text(
          "Bienvenido a Viaja Plus!",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: teaGreen, fontSize: 24, shadows: <Shadow>[
            Shadow(
              offset: Offset(10.0, 5.0),
              blurRadius: 3.0,
            ),
          ]),
        ),
        actions: [
          TextButton(
            onPressed: () => {
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
            onPressed: () => {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const BookTickets(),
                ),
              ),
            },
            child: const Text("Mantenimiento de Unidades", style: textoBotones)
          ),
          (user == null)
              ? TextButton(
                  onPressed: () => Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Login(),
                    ),
                  ),
                  child: const Text('Ingresar', style: textoBotones),
                )
              : TextButton(
                  onPressed: () {
                    AuthService.signOut();
                  },
                  child: const Text('Cerrar Sesión'),
                )
        ],
      );
    }
  }
}
