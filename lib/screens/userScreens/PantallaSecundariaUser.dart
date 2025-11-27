import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/config/utils/Music.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/screens/userScreens/PerfilUsuario.dart';
import 'package:carloslangac1_2/widgets/widgetsUsuario/PageHome.dart';
import 'package:carloslangac1_2/widgets/widgetsUsuario/PagePedidos.dart';
import 'package:carloslangac1_2/widgets/widgetsUsuario/PageYo.dart';
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
    _parar();
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

  void _parar() async{
    await Music.stopMusic();
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
  
  String titulo(String bienvenido, String sr, String sra){
    switch (widget.usuario.getTrata()){
      case 0:
        return bienvenido + ' '+ sr + ' ' + widget.usuario.getNombre();
      
      case 2:
        return bienvenido + ' '+ sra + ' ' + widget.usuario.getNombre();

      default:
        return bienvenido + ' ' + widget.usuario.getNombre();
    }
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      drawer: DrawerUsuario(onTap: [_pantallaPrincipal,_perfil,_salir],),
      appBar: AppBar(
        backgroundColor: MyColors.bannerColor,
        title: Text(titulo(l10n.bienvenido,l10n.sr,l10n.sra)),
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
          BottomNavigationBarItem(icon: Icon(Icons.house), label: l10n.compra),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: l10n.pedidos),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: l10n.yo)
        ]
          
      )
    );
  }
}