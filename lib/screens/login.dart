import 'package:flutter/material.dart';
import 'package:viaja_plus/services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          final a = await AuthService.login('admin@admin.com', 'admin1234');
          //print(a);
        },
        child: Text('Login'),
      ),
    );
  }
}
