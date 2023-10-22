import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viaja_plus/screens/test_categoria.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://odsqeylrqewxnvsubwgn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kc3FleWxycWV3eG52c3Vid2duIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc5ODExNDIsImV4cCI6MjAxMzU1NzE0Mn0.wbRXvTX04i5FBHzuaEdFamQQjonTXINDnmj9whwecUo',
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Test(),
        ),
      ),
    );
  }
}
