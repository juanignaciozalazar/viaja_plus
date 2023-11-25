import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseController {
  SupabaseController();
  static final _supabase = Supabase.instance.client;

  static Future<bool> agregarCategoria(String descripcion) async {
    try {
      bool response = await _supabase
          .from('categoria')
          .insert({'descripcion': descripcion});
      if (response) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
