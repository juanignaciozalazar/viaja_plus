import 'package:flutter/material.dart';

import '../services/auth.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SignupForm()),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: _emailController,
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
          // Password
          TextFormField(
            controller: _passwordController,
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
          // Boton ingresar
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Creando usuario')),
                );
                AuthService.signUp(
                  _emailController.text,
                  _passwordController.text,
                );
              }
            },
            child: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
