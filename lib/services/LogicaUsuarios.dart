import 'package:carloslangac1_2/models/User.dart';

class LogicaUsuarios {

  static final List<User> _listaUser = [
    User(nombre:"admin", edad: 99, passwrd: 'admin',
    trata: 0, nacimiento: 'Zaragoza'),
  ];

  static void addUser(User usuario){
    _listaUser.add(usuario);
  }

  static List<User> getListaUser(){
    return _listaUser;
  }
}