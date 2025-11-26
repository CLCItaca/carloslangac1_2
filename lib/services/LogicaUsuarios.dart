import 'package:carloslangac1_2/models/User.dart';

class LogicaUsuarios {

  static final List<User> _listaUser = [
    User(nombre:"admin", edad: 99, passwrd: 'admin',
    trata: 0, nacimiento: 'Zaragoza', admin: true, active: true,
    imgPath: 'assets/images/admin.png'),
    User(nombre:"Carlos", edad: 24, passwrd: 'Carlos',
    trata: 0, nacimiento: 'Calatayud', admin: false, active: true,
    imgPath: 'assets/images/User_icon_2.png')
  ];

  static void addUser(User usuario){
    _listaUser.add(usuario);
  }

  static List<User> getListaUser(){
    return _listaUser;
  }
}