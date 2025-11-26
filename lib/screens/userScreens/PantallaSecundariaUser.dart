import 'package:carloslangac1_2/screens/userScreens/PerfilUsuario.dart';
import 'package:carloslangac1_2/screens/userScreens/PageHome.dart';
import 'package:carloslangac1_2/screens/userScreens/PagePedidos.dart';
import 'package:carloslangac1_2/screens/userScreens/PageYo.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:flutter/services.dart';
import 'package:carloslangac1_2/widgets/DrawerUsuario.dart';

class PantallaSecundariaUser extends StatefulWidget {
  final User usuario;
  const PantallaSecundariaUser({super.key, required this.usuario});

  @override
  State<PantallaSecundariaUser> createState() => _PantallaSecundariaUserState();
}

class _PantallaSecundariaUserState extends State<PantallaSecundariaUser> {
  int _pageNumber = 0;

  void _pantallaPrincipal(){
    Navigator.pop(context, true);
    Navigator.pop(context);
  }

  void _perfil() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PerfilUsuario(usuario: widget.usuario))
    );
  }

  void _salir() {
    Navigator.pop(context);
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  Widget page(int index){
    switch(index){
      case 0:
        return PageHome(usuario: widget.usuario);
      case 1:
        return PagePedidos(usuario: widget.usuario);
      case 2:
        return PageYo(usuario: widget.usuario);
      default:
        return Placeholder();
    }
  }
  
  String titulo(){
    switch (widget.usuario.getTrata()){
      case 0:
        return "Bienvenido Sr. " + widget.usuario.getNombre();
      
      case 2:
        return "Bienvenida Sra. " + widget.usuario.getNombre();

      default:
        return "Bienvenido " + widget.usuario.getNombre();
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: DrawerUsuario(onTap: [_pantallaPrincipal,_perfil,_salir],),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text(titulo()),
      ),
      body: Center(
        child: page(_pageNumber),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageNumber,
        onTap: (value){
          setState(() {
            _pageNumber = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Yo')
        ]
          
      )
    );
  }
}