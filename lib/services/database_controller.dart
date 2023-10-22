import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseController {
  SupabaseController();
  final supabase = Supabase.instance.client;

  Future<bool> agregarCategoria(String descripcion) async {
    try {
      bool response =
          await supabase.from('categoria').insert({'descripcion': descripcion});
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
