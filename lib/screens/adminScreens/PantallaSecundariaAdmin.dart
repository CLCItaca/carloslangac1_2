import 'package:carloslangac1_2/screens/adminScreens/PagePedidosAdmin.dart';
import 'package:carloslangac1_2/screens/adminScreens/PageProductos.dart';
import 'package:carloslangac1_2/screens/adminScreens/PageUsuarios.dart';
import 'package:carloslangac1_2/screens/userScreens/PerfilUsuario.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:flutter/services.dart';
import 'package:carloslangac1_2/widgets/DrawerUsuario.dart';

class PantallaSecundariaAdmin extends StatefulWidget {
  final User usuario;
  const PantallaSecundariaAdmin({super.key, required this.usuario});

  @override
  State<PantallaSecundariaAdmin> createState() => _PantallaSecundariaAdminState();
}

class _PantallaSecundariaAdminState extends State<PantallaSecundariaAdmin> {
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
        return PageProductos(usuario: widget.usuario);
      case 1:
        return PagePedidosAdmin();
      case 2:
        return PageUsuarios(usuario: widget.usuario);
      default:
        return Placeholder();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: DrawerUsuario(onTap: [_pantallaPrincipal,_perfil,_salir],),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text('Administrador'),
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
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Productos'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Usuarios')
        ]
          
      )
    );
  }
}