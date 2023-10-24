import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viaja_plus/models/user_data.dart';

class AuthService {
  static final supabase = Supabase.instance.client;

  static Future<bool> signUp(String email, String password, String name,
      String surname, String role, DateTime? birthDate) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        try {
          final creationResponse = await _createUserData(
              response.user!, name, surname, role, birthDate);
          if (creationResponse) {
            print('Exito creando los datos del usuario');
            return true;
          } else {
            print('No se pudo crear los datos del usuario');
            return false;
          }
        } catch (ex) {
          print('Ocurrio un error creando los datos del usuario');
          await supabase
              .from('auth.users')
              .delete()
              .eq('id', response.user!.id);
          return false;
        }
      } else {
        print('Ocurrio un error creando el usuario');
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  static Future<bool> _createUserData(User user, String name, String surname,
      String role, DateTime? birthDate) async {
    try {
      final response = await supabase.from('usuario').insert({
        'uid': user.id,
        'email': user.email,
        'nombre': name,
        'apellido': surname,
        'rol': role,
        'fecha_nacimiento': birthDate,
      });
      if (response != null) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      var response = await supabase.auth
          .signInWithPassword(email: email, password: password);
      if (response.user != null) {
        print(response.user!.id);
        var x = await _buildUser(response.user!);
        print(x);
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  static Future<UserData?> _buildUser(User user) async {
    // final data = await supabase.from('usuario').select<Map<String, dynamic>>('''
    //     uid,
    //     email,
    //     nombre,
    //     apellido,
    //     fecha_nacimiento,
    //     rol
    //   ''').eq('uid', user.id).single();
    final data = await supabase
        .from('usuario')
        .select<Map<String, dynamic>>()
        .eq('uid', user.id)
        .single();
    print(data);
    if (data.isNotEmpty) {
      for (var a in data.keys) {
        print(a);
      }
    }
  }
}
