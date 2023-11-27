import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viaja_plus/screens/home/home.dart';
import 'package:viaja_plus/services/auth.dart';

import 'models/user_data.dart';
//import 'package:viaja_plus/screens/test_categoria.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
    return StreamProvider<UserData?>.value(
      value: AuthService().userData,
      initialData: null,
      child: MaterialApp(
        title: 'Viaja Plus',
        //scrollBehavior: ScrollBehavior(),
        home: Home(),
        navigatorKey: navigatorKey,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Home(),
  //     title: "Viaja Plus",
  //   );
  // }
}
