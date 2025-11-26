import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/screens/userScreens/Contacto.dart';
import 'package:carloslangac1_2/screens/userScreens/EditarUsuario.dart';
import 'package:flutter/material.dart';

class PageYo extends StatefulWidget {
  final User usuario;
  const PageYo({super.key, required this.usuario});

  @override
  State<PageYo> createState() => _PageYoState();
}

class _PageYoState extends State<PageYo> {
  void _irAPerfil(){
    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => EditarUsuario(usuario: widget.usuario))
    );
  }
  void _irAContacto(){
    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => Contacto())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: _irAContacto, 
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 40),
                backgroundColor: Color.fromARGB(255, 227, 237, 255),
              ),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color:Color.fromARGB(255, 22, 104, 255)),
                    Text('Contacto')
                  ],
                ),
                
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: _irAPerfil, 
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 40),
                backgroundColor: Color.fromARGB(255, 227, 237, 255),
              ),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, color:Color.fromARGB(255, 22, 104, 255)),
                    Text('Editar Usuario')
                  ],
                ),
                
              )
            ],
          )
        ],
      )
    );
  }
}