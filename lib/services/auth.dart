import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viaja_plus/models/user_data.dart';
import 'package:viaja_plus/models/user_profile.dart';

class AuthService {
  static final supabase = Supabase.instance.client;

  static final StreamController<UserData?> _userChangeController =
      StreamController.broadcast();

  Stream<UserData?> get userData {
    _refreshUserData();
    return _userChangeController.stream;
  }

  static Future<bool> signUp(String email, String password) async {
    // try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    if (response.user != null) {
      var buildResponse = await _buildUserData(response.user);
      _userChangeController.add(buildResponse);
      return true;
    } else {
      print('Ocurrio un error creando el usuario');
      return false;
    }
    // } catch (ex) {
    //   print(ex.toString());
    //   return false;
    // }
  }

  static Future<bool> createUserProfile(UserData userData, String name,
      String surname, String role, DateTime? birthDate) async {
    try {
      final response = await supabase.from('usuario').insert({
        'uid': userData.user.id,
        'email': userData.user.email,
        'nombre': name,
        'apellido': surname,
        'rol': role,
        'fecha_nacimiento': birthDate,
      });
      if (response != null) {
        userData.profile = await _buildUserProfile(userData.user);
        _userChangeController.add(userData);
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
        var userDataResponse = await _buildUserData(response.user);
        print(userDataResponse);
        _userChangeController.add(userDataResponse);
        return true;
      } else {
        _userChangeController.add(null);
        return false;
      }
    } catch (ex) {
      print(ex);
      _userChangeController.add(null);
      return false;
    }
  }

  static void signOut() {
    supabase.auth.signOut().whenComplete(
      () {
        _userChangeController.add(null);
      },
    );
  }

  static Future<UserData?> _buildUserData(User? user) async {
    if (user != null) {
      return UserData(
        user: user,
        profile: await _buildUserProfile(user),
      );
    } else {
      return null;
    }
  }

  static Future<UserProfile?> _buildUserProfile(User user) async {
    // try {
    final data = await supabase
        .from('perfil')
        .select<Map<String, dynamic>?>()
        .eq('uid', user.id)
        .maybeSingle();

    if (data != null && data.isNotEmpty) {
      print(data['rol']);
      print(data['fecha_nacimiento']);
      return UserProfile(
        name: data['nombre'],
        surname: data['apellido'],
        birthDate:
            (data['fecha_nacimiento'] == '' || data['fecha_nacimiento'] == null)
                ? null
                : DateTime.parse(data['fecha_nacimiento']),
        role: UserRoles.values.firstWhere(
          (element) => element.name == data['rol'],
          orElse: () => UserRoles.cliente,
        ),
      );
    } else {
      print('El usuario no tiene un perfil creado');
      return null;
    }
    // } catch (ex) {
    //   print('Ocurrio un error obteniendo los datos del usuario');
    //   return null;
    // }
  }

  void _refreshUserData() async {
    if (supabase.auth.currentUser != null) {
      _userChangeController.add(
        await _buildUserData(supabase.auth.currentUser),
      );
    }
  }
}
