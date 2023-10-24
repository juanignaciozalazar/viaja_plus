class UserData {
  String uid;
  String email;
  String nombre;
  String apellido;
  DateTime? fechaNacimiento;

  UserData({
    required this.uid,
    required this.email,
    required this.nombre,
    required this.apellido,
    this.fechaNacimiento,
  });
}
