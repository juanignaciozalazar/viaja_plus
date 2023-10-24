import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://odsqeylrqewxnvsubwgn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kc3FleWxycWV3eG52c3Vid2duIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc5ODExNDIsImV4cCI6MjAxMzU1NzE0Mn0.wbRXvTX04i5FBHzuaEdFamQQjonTXINDnmj9whwecUo',
  );

  var a = await Supabase.instance.client.from('usuario').select();
  print(a);
}
