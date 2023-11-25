import 'package:flutter/material.dart';
import 'package:viaja_plus/services/auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
        ),
      ),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Email
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text('Email'),
                      hintText: 'Ingrese su direccion de correo electronico',
                      constraints: BoxConstraints.loose(
                        const Size.fromWidth(300),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim() == '') {
                        return 'El email no puede estar vacio';
                      } else if (isValidEmail(value)) {
                        return null;
                      } else {
                        return 'El email tiene un formato incorrecto';
                      }
                    },
                  ),
                ),
                // Password
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text('Contraseña'),
                      hintText: 'Ingrese una contraseña',
                      constraints: BoxConstraints.loose(
                        const Size.fromWidth(300),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim() == '') {
                        return 'La contraseña no puede estar vacia';
                      } else if (value.length < 8) {
                        return 'La contraseña debe tener al menos 8 caracteres';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                // Boton ingresar
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Iniciando sesion')),
                      );
                      AuthService.login(
                        _emailController.text,
                        _passwordController.text,
                      ).then(
                        (value) {
                          if (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Sesion iniciada exitosamente'),
                              ),
                            );
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Error al iniciar sesion'),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                  child: const Text('Crear Usuario'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
