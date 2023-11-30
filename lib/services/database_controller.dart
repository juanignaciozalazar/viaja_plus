import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viaja_plus/models/unidad_transporte.dart';

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

  static Future<List<Map<String, dynamic>>> getLocalidades(
      String? filter) async {
    filter ??= '';
    var result = await _supabase
        .from('localidad')
        .select<List<Map<String, dynamic>>>('id_localidad, nombre')
        .or('nombre.like.%$filter%,nombre_terminal.like.%$filter%');

    return result;
  }

  static Future<List<Map<String, dynamic>>> getOfertas(int localidadOrigen,
      int localidadDestino, DateTime fecha, int cantidadAsientos) async {
    fecha = DateUtils.dateOnly(fecha);

    var result = await _supabase.rpc(
      'get_ofertas',
      params: {
        'origen': localidadOrigen,
        'destino': localidadDestino,
        'fecha': fecha,
        'cantidad_asientos': cantidadAsientos,
      },
    );
    return result;
  }

  static Future<List<Map<String, dynamic>>> getAsientosDisponibles(
      int idServicio, int localidadOrigen, int localidadDestino) async {
    var result = await _supabase
        .rpc('get_asientos_disponibles', params: {'servicio': idServicio});
    return result;
  }

  static Future<bool> insertUnidadTransporte(
      CantPisos cantPisos,
      Categorias categoria,
      String patente,
      List<Map<String, dynamic>> disposicion) async {
    try {
      var unidadResult = await _supabase.from('unidad_transporte').insert({
        'cant_pisos': cantPisos,
        'categoria': categoria,
        'patente': patente,
      }).select('id_unidad');

      var disposicionResult =
          await _supabase.from('disposicion').insert(disposicion
              .map(
                (e) => {
                  'id_unidad': unidadResult['id_unidad'],
                  'piso': e['piso'],
                  'fila': e['fila'],
                  'hilera': e['hilera'],
                },
              )
              .toList());

      return true;
    } catch (er) {
      print(er);
      return false;
    }

    return false;
  }
}
