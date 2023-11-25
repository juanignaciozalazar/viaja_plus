import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viaja_plus/models/user_profile.dart';

class UserData {
  User user;
  UserProfile? profile;

  UserData({required this.user, this.profile});
}
