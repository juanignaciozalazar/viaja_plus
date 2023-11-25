enum UserRoles {
  admin,
  cliente,
  programador,
}

class UserProfile {
  String name;
  String surname;
  DateTime? birthDate;
  UserRoles role;

  UserProfile({
    required this.name,
    required this.surname,
    required this.role,
    this.birthDate,
  });
}
