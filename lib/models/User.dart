class User {
  final String nombre;
  final int edad;
  final String passwrd;
  final int trata;
  final String nacimiento;

  User({
    required this.nombre,
    required this.edad,
    required this.passwrd,
    required this.trata,
    required this.nacimiento
  });

  String getNombre(){
    return nombre;
  }

  int getEdad(){
    return edad;
  }

  String getPasswrd(){
    return passwrd;
  }

  int getTrata(){
    return trata;
  }

  String getNacimiento(){
    return nacimiento;
  }
}