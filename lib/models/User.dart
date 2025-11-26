class User {
  String nombre;
  int edad;
  String passwrd;
  int trata;
  String nacimiento;
  bool active;
  bool admin;
  String imgPath;

  User({
    required this.nombre,
    required this.edad,
    required this.passwrd,
    required this.trata,
    required this.nacimiento,
    required this.active,
    required this.admin,
    required this.imgPath
  });

  String getNombre(){
    return nombre;
  }

  void setNombre(String nuevoNombre){
    nombre = nuevoNombre;
  }

  int getEdad(){
    return edad;
  }

  void setEdad(int nuevaEdad){
    edad = nuevaEdad;
  }

  String getPasswrd(){
    return passwrd;
  }

  void setPasswrd(String nuevaPass){
    passwrd = nuevaPass;
  }

  int getTrata(){
    return trata;
  }

  void setTrata(int nuevaTrata){
    trata = nuevaTrata;
  }

  String getNacimiento(){
    return nacimiento;
  }

  void setNacimiento(String nuevoNacimiento){
    nacimiento = nuevoNacimiento;
  }

  bool getAdmin(){
    return admin;
  }

  void changeAdmin(){
    admin = !admin;
  }

  bool getActive(){
    return active;
  }

  void changeActive(){
    active = !active;
  }

  String getImgPath(){
    return imgPath;
  }

  void setImgPath(String imgPath){
    this.imgPath = imgPath;
  }
}