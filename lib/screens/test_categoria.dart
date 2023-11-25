import 'package:flutter/material.dart';
import 'package:viaja_plus/services/database_controller.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              } else {
                return 'La descripcion no puede estar vacia';
              }
            },
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState != null &&
                  formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return FutureBuilder(
                      future:
                          SupabaseController.agregarCategoria(controller.text),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String mensaje = '';
                          if (snapshot.data!) {
                            mensaje = 'Se agrego la categoria exitosamente';
                          } else {
                            mensaje = 'Ocurrio un error agregando la categoria';
                          }
                          return AlertDialog(
                            title: const Text('Respuesta de creacion'),
                            content: Text(mensaje),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    );
                  },
                );
              }
            },
            child: const Text('Agregar Categoria'),
          ),
        ],
      ),
    );
  }
}
